#Use this file as a script for gnuplot
#(See http://www.gnuplot.info/ for details)

set title" #Blocks= 12, #Terminals= 9, #Nets= 10, Area=9.22253e+07, HPWL= 83480 "

set nokey
#   Uncomment these two lines starting with "set"
#   to save an EPS file for inclusion into a latex document
# set terminal postscript eps color solid 20
# set output "result.eps"

#   Uncomment these two lines starting with "set"
#   to save a PS file for printing
# set terminal postscript portrait color solid 20
# set output "result.ps"


set xrange [-11730:11730]

set yrange [-50:11730]

set label "m0" at 10880 , 2016 center 

set label "B" at 10880 , 3192


set label "G" at 10720 , 2016


set label "S" at 10560 , 420


set label "m22" at 800 , 2016 center 

set label "B" at 800 , 3192


set label "G" at 640 , 2016


set label "S" at 480 , 420


set label "m16" at 5280 , 2016 center 

set label "B" at 5280 , 3192


set label "D" at 5120 , 504


set label "G" at 5120 , 2016


set label "S" at 5280 , 336


set label "m17" at 6720 , 2016 center 

set label "B" at 6720 , 3192


set label "D" at 6880 , 504


set label "G" at 6880 , 2016


set label "S" at 6720 , 336


set label "m7" at 10880 , 5880 center 

set label "B" at 10880 , 7056


set label "D" at 10720 , 4368


set label "G" at 10720 , 5880


set label "S" at 10880 , 4200


set label "m8" at 5280 , 5880 center 

set label "B" at 5280 , 7056


set label "D" at 5120 , 4368


set label "G" at 5120 , 5880


set label "S" at 5280 , 4200


set label "m15" at 6720 , 5880 center 

set label "B" at 6720 , 7056


set label "D" at 6880 , 4368


set label "G" at 6880 , 5880


set label "S" at 6720 , 4200


set label "m13_m14" at 3200 , 2016 center 

set label "B" at 3200 , 3192


set label "DA" at 3200 , 1260


set label "DB" at 3360 , 1428


set label "S" at 3200 , 336


set label "m12_m10" at 8800 , 2016 center 

set label "B" at 8800 , 3192


set label "DA" at 8320 , 504


set label "DB" at 9280 , 672


set label "G" at 8800 , 2016


set label "S" at 8800 , 336


set label "m19_m18" at 8800 , 5880 center 

set label "B" at 8800 , 7056


set label "DA" at 8320 , 4368


set label "DB" at 9280 , 4536


set label "G" at 8800 , 5880


set label "S" at 8800 , 4200


set label "m3_m4" at 3200 , 5880 center 

set label "B" at 3200 , 7056


set label "DA" at 3360 , 5208


set label "DB" at 3520 , 5376


set label "SA" at 2560 , 4200


set label "SB" at 3840 , 4368


set label "m6_m5" at 960 , 5880 center 

set label "B" at 960 , 7056


set label "DA" at 640 , 4368


set label "DB" at 960 , 4536


set label "GA" at 640 , 5880


set label "GB" at 960 , 6048


set label "S" at 960 , 4200


set label "intern" at 11680 , 2016 center 

set label "interp" at 0 , 2016 center 

set label "outm" at 5120 , 0 center 

set label "crossp" at 8320 , 0 center 

set label "outp" at 6880 , 0 center 

set label "crossn" at 9280 , 0 center 

set label "clk" at 11680 , 5880 center 

set label "_net1" at 0 , 5880 center 

set label "_net0" at 11680 , 6048 center 

plot[:][:] '-' with lines linestyle 3, '-' with lines linestyle 7, '-' with lines linestyle 1, '-' with lines linestyle 0

# block m0 select 0 bsize 4
	10240	168
	10240	3864
	11520	3864
	11520	168
	10240	168

# block m22 select 0 bsize 4
	160	168
	160	3864
	1440	3864
	1440	168
	160	168

# block m16 select 0 bsize 4
	4640	168
	4640	3864
	5920	3864
	5920	168
	4640	168

# block m17 select 0 bsize 4
	7360	168
	7360	3864
	6080	3864
	6080	168
	7360	168

# block m7 select 0 bsize 4
	10240	4032
	10240	7728
	11520	7728
	11520	4032
	10240	4032

# block m8 select 0 bsize 4
	4640	4032
	4640	7728
	5920	7728
	5920	4032
	4640	4032

# block m15 select 0 bsize 4
	7360	4032
	7360	7728
	6080	7728
	6080	4032
	7360	4032

# block m13_m14 select 0 bsize 4
	1920	168
	1920	3864
	4480	3864
	4480	168
	1920	168

# block m12_m10 select 0 bsize 4
	7520	168
	7520	3864
	10080	3864
	10080	168
	7520	168

# block m19_m18 select 0 bsize 4
	7520	4032
	7520	7728
	10080	7728
	10080	4032
	7520	4032

# block m3_m4 select 0 bsize 4
	1920	4032
	1920	7728
	4480	7728
	4480	4032
	1920	4032

# block m6_m5 select 0 bsize 4
	160	4032
	160	7728
	1760	7728
	1760	4032
	160	4032


EOF
	10312	3160
	10312	3224
	11448	3224
	11448	3160
	10312	3160

	10488	1984
	10488	2048
	10952	2048
	10952	1984
	10488	1984

	10520	264
	10520	576
	10600	576
	10600	264
	10520	264

	232	3160
	232	3224
	1368	3224
	1368	3160
	232	3160

	408	1984
	408	2048
	872	2048
	872	1984
	408	1984

	440	264
	440	576
	520	576
	520	264
	440	264

	4712	3160
	4712	3224
	5848	3224
	5848	3160
	4712	3160

	4888	472
	4888	536
	5352	536
	5352	472
	4888	472

	4888	1984
	4888	2048
	5352	2048
	5352	1984
	4888	1984

	5048	304
	5048	368
	5512	368
	5512	304
	5048	304

	7288	3160
	7288	3224
	6152	3224
	6152	3160
	7288	3160

	7112	472
	7112	536
	6648	536
	6648	472
	7112	472

	7112	1984
	7112	2048
	6648	2048
	6648	1984
	7112	1984

	6952	304
	6952	368
	6488	368
	6488	304
	6952	304

	10312	7024
	10312	7088
	11448	7088
	11448	7024
	10312	7024

	10488	4336
	10488	4400
	10952	4400
	10952	4336
	10488	4336

	10488	5848
	10488	5912
	10952	5912
	10952	5848
	10488	5848

	10648	4168
	10648	4232
	11112	4232
	11112	4168
	10648	4168

	4712	7024
	4712	7088
	5848	7088
	5848	7024
	4712	7024

	4888	4336
	4888	4400
	5352	4400
	5352	4336
	4888	4336

	4888	5848
	4888	5912
	5352	5912
	5352	5848
	4888	5848

	5048	4168
	5048	4232
	5512	4232
	5512	4168
	5048	4168

	7288	7024
	7288	7088
	6152	7088
	6152	7024
	7288	7024

	7112	4336
	7112	4400
	6648	4400
	6648	4336
	7112	4336

	7112	5848
	7112	5912
	6648	5912
	6648	5848
	7112	5848

	6952	4168
	6952	4232
	6488	4232
	6488	4168
	6952	4168

	1992	3160
	1992	3224
	4408	3224
	4408	3160
	1992	3160

	3160	432
	3160	2088
	3240	2088
	3240	432
	3160	432

	3320	600
	3320	2256
	3400	2256
	3400	600
	3320	600

	2328	304
	2328	368
	4072	368
	4072	304
	2328	304

	7592	3160
	7592	3224
	10008	3224
	10008	3160
	7592	3160

	8088	472
	8088	536
	8552	536
	8552	472
	8088	472

	9048	640
	9048	704
	9512	704
	9512	640
	9048	640

	8088	1984
	8088	2048
	9512	2048
	9512	1984
	8088	1984

	7928	304
	7928	368
	9672	368
	9672	304
	7928	304

	7592	7024
	7592	7088
	10008	7088
	10008	7024
	7592	7024

	8088	4336
	8088	4400
	8552	4400
	8552	4336
	8088	4336

	9048	4504
	9048	4568
	9512	4568
	9512	4504
	9048	4504

	8088	5848
	8088	5912
	9512	5912
	9512	5848
	8088	5848

	7928	4168
	7928	4232
	9672	4232
	9672	4168
	7928	4168

	1992	7024
	1992	7088
	4408	7088
	4408	7024
	1992	7024

	3320	4464
	3320	5952
	3400	5952
	3400	4464
	3320	4464

	3480	4632
	3480	6120
	3560	6120
	3560	4632
	3480	4632

	2328	4168
	2328	4232
	2792	4232
	2792	4168
	2328	4168

	3608	4336
	3608	4400
	4072	4400
	4072	4336
	3608	4336

	232	7024
	232	7088
	1688	7088
	1688	7024
	232	7024

	408	4336
	408	4400
	872	4400
	872	4336
	408	4336

	728	4504
	728	4568
	1192	4568
	1192	4504
	728	4504

	408	5848
	408	5912
	872	5912
	872	5848
	408	5848

	728	6016
	728	6080
	1192	6080
	1192	6016
	728	6016

	568	4168
	568	4232
	1352	4232
	1352	4168
	568	4168


EOF

	11660	1996
	11660	2036
	11700	2036
	11700	1996
	11660	1996

	-20	1996
	-20	2036
	20	2036
	20	1996
	-20	1996

	5100	-20
	5100	20
	5140	20
	5140	-20
	5100	-20

	8300	-20
	8300	20
	8340	20
	8340	-20
	8300	-20

	6860	-20
	6860	20
	6900	20
	6900	-20
	6860	-20

	9260	-20
	9260	20
	9300	20
	9300	-20
	9260	-20

	11660	5860
	11660	5900
	11700	5900
	11700	5860
	11660	5860

	-20	5860
	-20	5900
	20	5900
	20	5860
	-20	5860

	11660	6028
	11660	6068
	11700	6068
	11700	6028
	11660	6028

EOF

#Net: intern
	10720	2016
	9280	4536
	10720	2016

	10720	2016
	3840	4368
	10720	2016

	10720	2016
	960	4536
	10720	2016

	10720	2016
	11680	2016
	10720	2016


#Net: interp
	640	2016
	8320	4368
	640	2016

	640	2016
	2560	4200
	640	2016

	640	2016
	640	4368
	640	2016

	640	2016
	0	2016
	640	2016


#Net: outm
	5120	504
	5120	4368
	5120	504

	5120	504
	5120	0
	5120	504


#Net: crossp
	5120	2016
	5120	5880
	5120	2016

	5120	2016
	3200	1260
	5120	2016

	5120	2016
	8320	504
	5120	2016

	5120	2016
	3360	5208
	5120	2016

	5120	2016
	8320	0
	5120	2016


#Net: outp
	6880	504
	6880	4368
	6880	504

	6880	504
	6880	0
	6880	504


#Net: crossn
	6880	2016
	6880	5880
	6880	2016

	6880	2016
	3360	1428
	6880	2016

	6880	2016
	9280	672
	6880	2016

	6880	2016
	3520	5376
	6880	2016

	6880	2016
	9280	0
	6880	2016


#Net: net050
	10720	4368
	960	4200
	10720	4368


#Net: clk
	10720	5880
	8800	2016
	10720	5880

	10720	5880
	8800	5880
	10720	5880

	10720	5880
	11680	5880
	10720	5880


#Net: _net1
	640	5880
	0	5880
	640	5880


#Net: _net0
	960	6048
	11680	6048
	960	6048


EOF

pause -1 'Press any key'