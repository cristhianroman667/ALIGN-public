#!/usr/bin/env python

import sys
sys.path.append( '..')
sys.path.append( '../..')

import networkx as nx
import pysat
import os
import re

def cr( g, e):
  G = g.copy()
  G.remove_edge( e[0], e[1], key=e[2])
  return G

def se( g, n):
  return g.number_of_edges() == 1 and len(g.edges(n)) == 1

def all_euler_pair_paths( t0, t1):
   (g0, n0) = t0
   (g1, n1) = t1

   if se( g0, n0) and se( g1, n1):
      e0 = g0.edges(n0,keys=True,data=True)[0]
      e1 = g1.edges(n1,keys=True,data=True)[0]
      if e0[3]['label'] == e1[3]['label']: # Labels equal
         return [([e0],[e1])]
   
   QQQ = [ ([e0] + p0,[e1] + p1) 
               for e0 in g0.edges(n0,keys=True,data=True)
               for e1 in g1.edges(n1,keys=True,data=True)
               if e0[3]['label'] == e1[3]['label']
               for (p0,p1) in all_euler_pair_paths( (cr(g0,e0), e0[1]), (cr(g1,e1), e1[1])) ]
   
   return QQQ


def all_euler_paths(g, n):
    if se( g, n):
       return [g.edges(n,keys=True,data=True)]

    return [ [e] + p for e in g.edges(n,keys=True,data=True)
                     for p in all_euler_paths( cr(g,e), e[1])]

def all_euler_paths_from_all_nodes( G):
   return [ p for n in G.nodes() for p in all_euler_paths( G, n)]

def all_euler_pair_paths_from_all_nodes( G0, G1):
   return [ pp for n0 in G0.nodes() for n1 in G1.nodes()
               for pp in all_euler_pair_paths( (G0, n0), (G1, n1))]


def gen_pair_graph( G0, G1):
   ns = Set()
   es = []
   for e0 in G0.edges(keys=True,data=True):
      for e1 in G1.edges(keys=True,data=True):
         if True or e0[3]['label'] == e1[3]['label']:
            ns.add( (e0[0],e1[0]))
            ns.add( (e0[1],e1[1]))
            ns.add( (e0[0],e1[1]))
            ns.add( (e0[1],e1[0]))
            es.append( ((e0[0],e1[0]),(e0[1],e1[1]),(e0[2],e1[2]),(e0[3]['label'],e1[3]['label'])))
            es.append( ((e0[0],e1[1]),(e0[1],e1[0]),(e0[2],e1[2]),(e0[3]['label'],e1[3]['label'])))

   G = nx.MultiDiGraph()
   G.add_nodes_from( list(ns))
   for e in es:
      G.add_edge( e[0], e[1], key=e[2], label=(str(e[2])+"_"+str(e[3])))

   return G

class SatBasedEulerPathsRow:
   def __init__( self, p, row_nm):
      self.p = p
      self.row_nm = row_nm


   def sat_based_euler_paths_aux( self, G):
      m = self.p.ncols
#   
# Build raster of unflipped transistors
# Build raster of flipped   transistors
# Build raster of diffusions
#   
   
      self.node_values = G.nodes()
      print( "node_values:", self.node_values)


      edge_values = map( lambda e: e[2], G.edges(keys=True))

      print( "edge_values:", edge_values)


      self.unflipped = [ self.p.mgr.add_var( pysat.PossiblyUnknownEnumVar( self.p.s, self.row_nm+('==>[%s]'%idx), edge_values)) for idx in range(0,m) ]
      self.flipped   = [ self.p.mgr.add_var( pysat.PossiblyUnknownEnumVar( self.p.s, self.row_nm+('<==[%s]'%idx), edge_values)) for idx in range(0,m) ]

      self.diffs     = [ self.p.mgr.add_var( pysat.PossiblyUnknownEnumVar( self.p.s, self.row_nm+('dif[%s]'%idx), self.node_values)) for idx in range(0,m+1) ]

      self.polys = [ self.p.mgr.add_var( pysat.PossiblyUnknownEnumVar( self.p.s, self.row_nm+('ply[%s]'%idx), self.p.gate_values)) for idx in range(0,m) ]



#
# For each transistor, make sure that it is instantiated at least once
#
      for ev in edge_values:
         self.p.s.emit_exactly_one( map( lambda t: t.var(ev), self.unflipped + self.flipped))

      for e in G.edges(keys=True,data=True):
         n0 = e[0]
         n1 = e[1]
         k  = e[2]      
         g  = e[3]['label']

# unflipped         
#    '==>[idx]' == g implies diffs[idx] == n0 and diffs[idx+1] == n1
         for idx in range(0,m):
            self.p.s.emit_implies( self.unflipped[idx].var(k), self.diffs[idx  ].var(n0))
            self.p.s.emit_implies( self.unflipped[idx].var(k), self.diffs[idx+1].var(n1))
            self.p.s.emit_implies( self.unflipped[idx].var(k), self.polys[idx].var(g))
         
# flipped         
#    '<==[idx]' == g implies diffs[idx] == n1 and diffs[idx+1] == n0
            self.p.s.emit_implies( self.flipped[idx].var(k), self.diffs[idx  ].var(n1))
            self.p.s.emit_implies( self.flipped[idx].var(k), self.diffs[idx+1].var(n0))
            self.p.s.emit_implies( self.flipped[idx].var(k), self.polys[idx].var(g))

#
# For each transistor spot, determine if the diffusions are different
#
      self.different_diffs = [ self.p.s.add_var() for idx in range(0,m) ]
      self.same_diffs = [ self.p.s.add_var() for idx in range(0,m) ]
      self.different_diffs_and_unknown_tran = [ self.p.s.add_var() for idx in range(0,m) ]

      self.tran_defined = [ self.p.s.add_var() for idx in range(0,m) ]

      for idx in range(0,m):
         diff_pairs = []
         same_diff = []
         for (v0,v1) in zip( self.diffs[idx].vars, self.diffs[idx+1].vars):
            z = self.p.s.add_var()
            self.p.s.emit_or( [v0,v1], z)         
            diff_pairs.append( z)
            qq = self.p.s.add_var()
            self.p.s.emit_and( [v0,v1], qq)
            same_diff.append( qq)

         c1 = self.p.s.add_var()
         self.p.s.emit_tally( diff_pairs, [c1,self.different_diffs[idx]])

         self.p.s.emit_or( same_diff, self.same_diffs[idx])

         self.p.s.emit_or( self.unflipped[idx].vars + self.flipped[idx].vars, self.tran_defined[idx])

#
# OK: not c1 or same_diff 
# BAD: c2 or c1 and not same_diff
#

         q0 = self.p.s.add_var()
         self.p.s.emit_and( [c1, pysat.Sat.neg( self.same_diffs[idx])], q0)
         q1 = self.p.s.add_var()
         self.p.s.emit_or( [q0,self.different_diffs[idx]], q1)
         self.p.s.emit_and( [pysat.Sat.neg( self.tran_defined[idx]), q1], self.different_diffs_and_unknown_tran[idx])
            

#      self.count_different_diffs_and_unknown_tran = [ self.p.s.add_var() for idx in range(0,m) ]
#      self.p.s.emit_tally( self.different_diffs_and_unknown_tran, self.count_different_diffs_and_unknown_tran)



class SatBasedEulerPaths:
   def __init__( self):
      self.s   = pysat.Sat()
      self.mgr = pysat.VarMgr( self.s)
      self.ncols = 0
      self.extra_cols = 0
      self.limit_different_polys = 0
      self.limit_channel_width = -1

   def check_that_edge_keys_are_unique( self, G):
      """
Check that each edge of the Multigraph G has a unique key
"""
      tbl = {}
      for ( e0, e1, k, l) in G.edges( keys=True, data=True):
         assert k not in tbl
         tbl[k] = True

   def sat_based_euler_paths( self, GP, GN):
      self.check_that_edge_keys_are_unique( GP)
      self.check_that_edge_keys_are_unique( GN)

      self.ncols = max( GP.number_of_edges(), GN.number_of_edges()) + self.extra_cols

      self.gate_values = list(set( \
         map( lambda e: e[3]['label'], GP.edges(keys=True,data=True)) +
         map( lambda e: e[3]['label'], GN.edges(keys=True,data=True))))

      self.row_p = SatBasedEulerPathsRow( self, 'P-')
      self.row_p.sat_based_euler_paths_aux( GP)

      self.row_n = SatBasedEulerPathsRow( self, 'N-')
      self.row_n.sat_based_euler_paths_aux( GN)

#
# No more than one name per gate
#
      self.different_polys = []
      self.same_polys = []

      for (p,n) in zip( self.row_p.polys, self.row_n.polys):
         same_poly = [] 
         pn_poly = [] 
         for (pp,nn) in zip( p.vars, n.vars):
            zz = self.s.add_var()
            self.s.emit_or( [pp,nn], zz)
            pn_poly.append( zz)
            qq = self.s.add_var()
            self.s.emit_and( [pp,nn], qq)
            same_poly.append( qq)
      
         c1 = self.s.add_var()
         c2 = self.s.add_var()
         self.s.emit_tally( pn_poly, [c1,c2])
         self.different_polys.append( c2)
         z = self.s.add_var()
         self.s.emit_or( same_poly, z)
         self.same_polys.append( z)

      d = [ self.s.add_var() for p in self.different_polys ]

      self.s.emit_tally( self.different_polys, d)
      if self.limit_different_polys in range(len(self.different_polys)):
        self.s.emit_never( d[self.limit_different_polys])

      if self.limit_channel_width >= 0:
         self.emit_channel_constraints()

#
# p and n diffusions same
#
      self.same_p_and_n_diffusions = []
      self.different_p_and_n_diffusions = []

      for (p,n) in zip( self.row_p.diffs, self.row_n.diffs):
         same_diff = [] 

         p_dict = dict( zip( p.vals, p.vars))

         print( "same_p_and_n_diffusions:", zip( p.vals, p.vars), zip( n.vals, n.vars))

         for (nval,nvar) in zip( n.vals, n.vars):
            if nval in p_dict:
               print( "Match:", nval)          
               same_diff.append( self.s.add_var())
               self.s.emit_and( [p_dict[nval],nvar], same_diff[-1])

         self.same_p_and_n_diffusions.append( self.s.add_var())
         print( "defining same_p_and_n_diffusions:", same_diff, self.same_p_and_n_diffusions[-1])
         self.s.emit_or( same_diff, self.same_p_and_n_diffusions[-1])



#
# Build left and channel scans
#
#
# Determine nets
#
   def emit_channel_constraints( self):

      self.all_net_values = list(set( self.gate_values + self.row_p.node_values + self.row_n.node_values))

      assert len(self.row_p.diffs) == len(self.row_n.diffs)
      assert len(self.row_p.diffs) == len(self.row_p.polys) + 1
      assert len(self.row_n.diffs) == len(self.row_n.polys) + 1

      m = len(self.row_p.diffs)

      left_scan = [ self.mgr.add_var( pysat.PowerSetEnumVar( self.s, 'ls[%02d]'%idx, self.all_net_values)) for idx in range(len(self.row_p.polys + self.row_p.diffs)) ]

      left_scan_in = []
      for idx in range(0,m):
         left_scan_in.append( [ self.row_p.diffs[idx], self.row_n.diffs[idx]])
         if idx < m-1:
            left_scan_in.append( [ self.row_p.polys[idx], self.row_n.polys[idx]])

      assert all( [ len(l) <= 2 for l in left_scan_in])

      self.build_scan( m, left_scan, left_scan_in)

      right_scan = [ self.mgr.add_var( pysat.PowerSetEnumVar( self.s, 'rs[%02d]'%idx, self.all_net_values)) for idx in range(len(self.row_p.polys + self.row_p.diffs)) ]
      right_scan.reverse()

      right_scan_in = [ l[:] for l in left_scan_in[:] ] # explicit deep copy
      right_scan_in.reverse()

      self.build_scan( m, right_scan, right_scan_in)

      right_scan.reverse()

      and_of_scans = [ self.mgr.add_var( pysat.PowerSetEnumVar( self.s, 'as[%02d]'%idx, self.all_net_values)) for idx in range(len(self.row_p.polys + self.row_p.diffs)) ]

      for ((l,r),q) in zip( zip( left_scan, right_scan), and_of_scans):      
         for val in q.vals:
            self.s.emit_and( [ l.var( val), r.var( val)], q.var( val))

      for q in and_of_scans:
         outs = [ self.s.add_var() for idx in range(self.limit_channel_width+1)]
         self.s.emit_tally( [ vr for (vl,vr) in zip(q.vals,q.vars) if vl not in ['vss','vcc']], outs)
         self.s.emit_never( outs[-1])

   def solve( self):
      self.s.solve()
      if self.s.indicator == 'UNSAT':
         print( 'UNSAT')
      else:     
         assert self.s.indicator == 'SAT'
         print( 'SAT')

         for nm,v in sorted( self.mgr.nm_map.items()):
            pass
#            print( '%s=%s'%(nm, v.val()))

   def build_scan( self, m, scn, scn_in):
      for idx in range(0,m):
         l = scn_in[2*idx][:]
         if idx > 0:
            l.append( scn[2*idx-1])

         for (val,var) in zip( scn[2*idx].vals, scn[2*idx].vars):
            ll = [ e.var(val) for e in l if val in e.vals ]
            self.s.emit_or( ll, var)

         if idx < m-1:
            l = scn_in[2*idx+1][:]
            l.append( scn[2*idx])
            for (val,var) in zip( scn[2*idx+1].vals, scn[2*idx+1].vars):
               ll = [ e.var(val) for e in l if val in e.vals ]
               self.s.emit_or( ll, var)

class SatPartitionAux:
   def __init__( self, dad, ty, G):
      self.dad = dad
      self.ty = ty
      self.G = G
      self.edges = G.edges( keys=True, data=True)
      self.vars = [ self.dad.mgr.add_var( pysat.BitVar( self.dad.s, ('%s_edge_%d' % (ty,idx)))) for (idx,e) in enumerate(self.edges)]
      self.semantic()

   def semantic( self):
      """
Count the number nets that touch a device with both p_var=off and p_var=on
"""
# foreach net, find all the devices, construct predicate both on and off, form a tally      

      for (idx,e) in enumerate(self.edges):
         ( diff0, diff1, k, lbl) = e
         for nm in [diff0, diff1, lbl['label']]:
            if nm not in self.dad.nets:
               self.dad.nets[nm] = []
            self.dad.nets[nm].append( (self.ty,idx))

#      print( nets)

      n = len(self.edges)
      out_vars = [ self.dad.s.add_var() for idx in range(n+1)]

      self.dad.s.emit_tally( map( lambda v: v.var(), self.vars), out_vars)
      
      if n % 4 == 2:
         assert n >= 2
         limit = n/2 + 1 
         print( "Limiting number of devices in %s master to %d of %d" % (self.ty, limit, n))
         self.dad.s.emit_always( out_vars[limit-1])
         self.dad.s.emit_never( out_vars[limit])
      else:
         assert n >= 2
         limit = n/2
         print( "Limiting number of devices in %s master to %d of %d" % (self.ty, limit, n))
         self.dad.s.emit_always( out_vars[limit-1])
         self.dad.s.emit_never( out_vars[limit])

   def split( self, mdl=None):
      G0 = nx.MultiDiGraph()
      G1 = nx.MultiDiGraph()

      if mdl:
         iv_m = dict( zip( self.dad.s.important_vars, mdl))

         m = {}
         for v in self.vars:
             assert v.var() in iv_m
             m[v] = iv_m[v.var()]

      else:
         m = dict( [ (v,v.val()) for v in self.vars])

      for ( tuple, var) in zip( self.edges, self.vars):
         ( e0, e1, k, lbl) = tuple
         if m[var]:
            G1.add_edge( e0, e1, key=k, label=lbl['label'])         
         else:   
            G0.add_edge( e0, e1, key=k, label=lbl['label'])         

      return (G0,G1)



class SatPartition:
   def __init__( self, GP, GN, args):
      """
Divide (GP,GN) into two graphs each, without about half the device (edges) in each graph, minimizing the number of wires that cross 
"""
      self.s   = pysat.Sat( args.use_picosat, args.use_eureka)
      self.mgr = pysat.VarMgr( self.s)
      self.limit_crossings = args.limit_crossings
      self.all_sat = args.all_sat
      self.nsols = args.nsols
      if self.nsols > 1:
         self.s.nsols = self.nsols

      self.nets = {}
      self.p_row = SatPartitionAux( self, 'p', GP)
      self.n_row = SatPartitionAux( self, 'n', GN)

      self.semantic()


   def print_model( self):

      if self.s.indicator == 'SAT':
         
         in_common = {}
         only_in_off = {}
         only_in_on = {}

         for ( (k, v), net_var) in zip( self.lst, self.net_vars):
            if k in ['vss','vcc']:
               in_common[k] = True
               print( 'rail', net_var)
            elif net_var.val():
               in_common[k] = True
               print( 'crossing', net_var)
            else:
               print( 'no crossing', net_var)
               for ( ty, idx) in v:
                  if   ty == 'p':
                     vv = self.p_row.vars[idx].val()
                  elif ty == 'n':
                     vv = self.n_row.vars[idx].val()
                  else:
                     assert False
                  if vv:
                     only_in_on[k] = True   
                  else:
                     only_in_off[k] = True   

            for ( ty, idx) in v:
               if   ty == 'p':
                  vv = self.p_row.vars[idx].val()
               elif ty == 'n':
                  vv = self.n_row.vars[idx].val()
               else:
                  assert False
               print( '   ', ty, idx, vv)


         print( 'Nets in common:', in_common.keys())
         print( 'Nets in master:', only_in_on.keys())
         print( 'Nets in slave:', only_in_off.keys())

         for nm,v in sorted( self.mgr.nm_map.items()):
            pass
#            print( '%s=%s'%(nm, v.val()))


   def semantic( self):
      self.lst = [ (k, Set( v)) for ( k, v) in self.nets.items()]

      self.net_vars = [ self.mgr.add_var( pysat.BitVar( self.s, ('net_%s' % k))) for (k, v) in self.lst]

      for ( (k, v), net_var) in zip(self.lst,self.net_vars):
         if k in ['vss','vcc']: continue

#
# Net all in group 0
#     all_false
# Net all in group 1
#     all true
# Otherwise
#     a mix; some one, and some off
#

         one_off = self.s.add_var()
         one_on  = self.s.add_var()

         self.s.emit_and( [one_off, one_on], net_var.var())

         or_on_vars = []
         or_off_vars = []

         for ( ty, idx) in v:
            if   ty == 'p':
               vv = self.p_row.vars[idx].var()
            elif ty == 'n':
               vv = self.n_row.vars[idx].var()
            else:
               assert False
            or_on_vars.append( vv)             
            or_off_vars.append( pysat.Sat.neg( vv))

         self.s.emit_or( or_on_vars, one_on)
         self.s.emit_or( or_off_vars, one_off)

      out_vars = [ self.s.add_var() for idx in range( self.limit_crossings+1)]

      self.s.emit_tally( [ v.var() for v in self.net_vars], out_vars)
      self.s.emit_never( out_vars[-1])

      if self.all_sat:
         self.s.important_vars = [ v.var() for v in self.p_row.vars] + [ v.var() for v in self.n_row.vars]
         self.s.solve()

         for ( idx, mdl) in enumerate( self.s.all_models):
            if idx > 0:
               print( 32*'=')
            print( "Model:", idx)

            (GP0,GP1) = self.p_row.split( mdl)
            (GN0,GN1) = self.n_row.split( mdl)

            print( '|P0|:', len(GP0.edges(keys=True,data=True)))
            print( '|N0|:', len(GN0.edges(keys=True,data=True)))
            print( '|P1|:', len(GP1.edges(keys=True,data=True)))
            print( '|N1|:', len(GN1.edges(keys=True,data=True)))

            master = [ e[2] for e in GP0.edges(keys=True,data=True) + GN0.edges(keys=True,data=True)]
            slave  = [ e[2] for e in GP1.edges(keys=True,data=True) + GN1.edges(keys=True,data=True)]

            print( "Option name=placement_group_dependency master=%s slave=%s" % ( ','.join( master), ','.join( slave)))


      else:
         self.s.solve()
         self.print_model()

if __name__ == "__main__":
  pass
