#Use this file as a script for gnuplot
#(See http://www.gnuplot.info/ for details)

set title" #Blocks= 11, #Terminals= 3, #Nets= 12, Area=1.8125e+10, HPWL= 293336 "

set nokey
#   Uncomment these two lines starting with "set"
#   to save an EPS file for inclusion into a latex document
# set terminal postscript eps color solid 20
# set output "result.eps"

#   Uncomment these two lines starting with "set"
#   to save a PS file for printing
# set terminal postscript portrait color solid 20
# set output "result.ps"


set xrange [-167378:167378]

set yrange [-50:167378]

set label "m1" at 2560 , 14616 center 

set label "B" at 2560 , 15792


set label "D" at 2400 , 13104


set label "G" at 2400 , 14616


set label "S" at 2560 , 12936


set label "c1" at 58160 , 50232 center 

set label "MINUS" at 58160 , 100296


set label "PLUS" at 58160 , 168


set label "c0" at 38320 , 133812 center 

set label "MINUS" at 38320 , 100968


set label "MINUS" at 38320 , 100968


set label "MINUS" at 38520 , 100968


set label "PLUS" at 27440 , 166656


set label "PLUS" at 27440 , 166656


set label "PLUS" at 49200 , 166656


set label "PLUS" at 49200 , 166656


set label "PLUS" at 38320 , 166656


set label "m29_m30_m3_m17" at 4080 , 2352 center 

set label "B" at 1520 , 168


set label "DA" at 1520 , 168


set label "DB" at 1520 , 168


set label "DC" at 1520 , 168


set label "DD" at 1520 , 168


set label "S" at 1520 , 168


set label "m31_m0" at 4880 , 14616 center 

set label "B" at 4880 , 15792


set label "DA" at 4560 , 13860


set label "DB" at 4880 , 13272


set label "S" at 4880 , 12936


set label "m22_m25" at 960 , 6552 center 

set label "B" at 960 , 7728


set label "DA" at 640 , 5796


set label "DB" at 960 , 5208


set label "S" at 960 , 4872


set label "m23_m24" at 7200 , 6552 center 

set label "B" at 7200 , 7728


set label "DA" at 7520 , 5796


set label "DB" at 7200 , 5208


set label "S" at 7200 , 4872


set label "m33_m32" at 4080 , 10752 center 

set label "B" at 4080 , 11928


set label "DA" at 3760 , 9996


set label "DB" at 4080 , 9408


set label "S" at 4080 , 9072


set label "m2_m27_m26" at 4080 , 6720 center 

set label "B" at 1920 , 4704


set label "DA" at 1920 , 4704


set label "DB" at 1920 , 4704


set label "DC" at 1920 , 4704


set label "SA" at 1920 , 4704


set label "SB" at 1920 , 4704


set label "SC" at 1920 , 4704


set label "m20_m18" at 960 , 10416 center 

set label "B" at 960 , 11592


set label "DA" at 640 , 8904


set label "DB" at 960 , 9072


set label "GA" at 640 , 10416


set label "GB" at 960 , 10584


set label "S" at 960 , 8736


set label "m21_m19" at 7200 , 10416 center 

set label "B" at 7200 , 11592


set label "DA" at 7520 , 8904


set label "DB" at 7200 , 9072


set label "GA" at 7520 , 10416


set label "GB" at 7200 , 10584


set label "S" at 7200 , 8736


set label "vout" at 0 , 10584 center 

set label "vbias" at 1520 , 0 center 

set label "vref" at 0 , 10416 center 

plot[:][:] '-' with lines linestyle 3, '-' with lines linestyle 7, '-' with lines linestyle 1, '-' with lines linestyle 0

# block m1 select 0 bsize 4
	1920	12768
	1920	16464
	3200	16464
	3200	12768
	1920	12768

# block c1 select 0 bsize 4
	8160	168
	8160	100296
	108160	100296
	108160	168
	8160	168

# block c0 select 0 bsize 4
	5840	100464
	5840	167160
	70800	167160
	70800	100464
	5840	100464

# block m29_m30_m3_m17 select 0 bsize 4
	1520	168
	1520	4536
	6640	4536
	6640	168
	1520	168

# block m31_m0 select 0 bsize 4
	4080	12768
	4080	16464
	5680	16464
	5680	12768
	4080	12768

# block m22_m25 select 0 bsize 4
	160	4704
	160	8400
	1760	8400
	1760	4704
	160	4704

# block m23_m24 select 0 bsize 4
	8000	4704
	8000	8400
	6400	8400
	6400	4704
	8000	4704

# block m33_m32 select 0 bsize 4
	3280	8904
	3280	12600
	4880	12600
	4880	8904
	3280	8904

# block m2_m27_m26 select 0 bsize 4
	1920	4704
	1920	8736
	6240	8736
	6240	4704
	1920	4704

# block m20_m18 select 0 bsize 4
	160	8568
	160	12264
	1760	12264
	1760	8568
	160	8568

# block m21_m19 select 0 bsize 4
	8000	8568
	8000	12264
	6400	12264
	6400	8568
	8000	8568


EOF
	1992	15760
	1992	15824
	3128	15824
	3128	15760
	1992	15760

	2168	13072
	2168	13136
	2632	13136
	2632	13072
	2168	13072

	2168	14584
	2168	14648
	2632	14648
	2632	14584
	2168	14584

	2328	12904
	2328	12968
	2792	12968
	2792	12904
	2328	12904

	8088	100264
	8088	100328
	108232	100328
	108232	100264
	8088	100264

	8088	136
	8088	200
	108232	200
	108232	136
	8088	136

	38288	100896
	38288	101040
	38352	101040
	38352	100896
	38288	100896

	38248	100936
	38248	101000
	38392	101000
	38392	100936
	38248	100936

	38320	100936
	38320	101000
	38720	101000
	38720	100936
	38320	100936

	27408	166584
	27408	166728
	27472	166728
	27472	166584
	27408	166584

	27368	166624
	27368	166688
	27512	166688
	27512	166624
	27368	166624

	49168	166584
	49168	166728
	49232	166728
	49232	166584
	49168	166584

	49128	166624
	49128	166688
	49272	166688
	49272	166624
	49128	166624

	27440	166624
	27440	166688
	49200	166688
	49200	166624
	27440	166624

	1520	168
	1520	168
	1520	168
	1520	168
	1520	168

	1520	168
	1520	168
	1520	168
	1520	168
	1520	168

	1520	168
	1520	168
	1520	168
	1520	168
	1520	168

	1520	168
	1520	168
	1520	168
	1520	168
	1520	168

	1520	168
	1520	168
	1520	168
	1520	168
	1520	168

	1520	168
	1520	168
	1520	168
	1520	168
	1520	168

	4152	15760
	4152	15824
	5608	15824
	5608	15760
	4152	15760

	4520	13032
	4520	14688
	4600	14688
	4600	13032
	4520	13032

	4648	13240
	4648	13304
	5112	13304
	5112	13240
	4648	13240

	4488	12904
	4488	12968
	5272	12968
	5272	12904
	4488	12904

	232	7696
	232	7760
	1688	7760
	1688	7696
	232	7696

	600	4968
	600	6624
	680	6624
	680	4968
	600	4968

	728	5176
	728	5240
	1192	5240
	1192	5176
	728	5176

	568	4840
	568	4904
	1352	4904
	1352	4840
	568	4840

	7928	7696
	7928	7760
	6472	7760
	6472	7696
	7928	7696

	7560	4968
	7560	6624
	7480	6624
	7480	4968
	7560	4968

	7432	5176
	7432	5240
	6968	5240
	6968	5176
	7432	5176

	7592	4840
	7592	4904
	6808	4904
	6808	4840
	7592	4840

	3352	11896
	3352	11960
	4808	11960
	4808	11896
	3352	11896

	3720	9168
	3720	10824
	3800	10824
	3800	9168
	3720	9168

	3848	9376
	3848	9440
	4312	9440
	4312	9376
	3848	9376

	3688	9040
	3688	9104
	4472	9104
	4472	9040
	3688	9040

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	1920	4704
	1920	4704
	1920	4704
	1920	4704
	1920	4704

	232	11560
	232	11624
	1688	11624
	1688	11560
	232	11560

	408	8872
	408	8936
	872	8936
	872	8872
	408	8872

	728	9040
	728	9104
	1192	9104
	1192	9040
	728	9040

	408	10384
	408	10448
	872	10448
	872	10384
	408	10384

	728	10552
	728	10616
	1192	10616
	1192	10552
	728	10552

	568	8704
	568	8768
	1352	8768
	1352	8704
	568	8704

	7928	11560
	7928	11624
	6472	11624
	6472	11560
	7928	11560

	7752	8872
	7752	8936
	7288	8936
	7288	8872
	7752	8872

	7432	9040
	7432	9104
	6968	9104
	6968	9040
	7432	9040

	7752	10384
	7752	10448
	7288	10448
	7288	10384
	7752	10384

	7432	10552
	7432	10616
	6968	10616
	6968	10552
	7432	10552

	7592	8704
	7592	8768
	6808	8768
	6808	8704
	7592	8704


EOF

	-20	10564
	-20	10604
	20	10604
	20	10564
	-20	10564

	1500	-20
	1500	20
	1540	20
	1540	-20
	1500	-20

	-20	10396
	-20	10436
	20	10436
	20	10396
	-20	10396

EOF

#Net: vout
	2400	13104
	58160	100296
	2400	13104

	2400	13104
	38320	100968
	2400	13104

	2400	13104
	4880	13272
	2400	13104

	2400	13104
	960	10584
	2400	13104

	2400	13104
	7200	10584
	2400	13104

	2400	13104
	0	10584
	2400	13104


#Net: net111
	2400	14616
	4080	9408
	2400	14616

	2400	14616
	1920	4704
	2400	14616

	2400	14616
	640	8904
	2400	14616


#Net: net107
	58160	168
	7200	5208
	58160	168

	58160	168
	1920	4704
	58160	168


#Net: vbias
	1520	168
	1520	0
	1520	168


#Net: net93
	1520	168
	4560	13860
	1520	168


#Net: net019
	1520	168
	1920	4704
	1520	168


#Net: net102
	1520	168
	960	11592
	1520	168

	1520	168
	960	8736
	1520	168

	1520	168
	7200	11592
	1520	168

	1520	168
	7200	8736
	1520	168


#Net: net99
	640	5796
	7520	8904
	640	5796


#Net: net114
	960	5208
	1920	4704
	960	5208


#Net: net103
	7520	5796
	7200	9072
	7520	5796


#Net: net96
	3760	9996
	1920	4704
	3760	9996

	3760	9996
	960	9072
	3760	9996


#Net: vref
	640	10416
	7520	10416
	640	10416

	640	10416
	0	10416
	640	10416


EOF

pause -1 'Press any key'