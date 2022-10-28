source backward_modified/initram-v5.sh -f pin1_1.gro -o aa_amber.gro -from martini -to amber -p topol.top
# pin1_1.gro is the CG format file
# aa_amber.gro is the output name, can be changed as you like.
# topol.top is generated based on gmx pdb2gmx -f pin1_part.pdb -o rec.gro -merge all -ignh
	-不管cg的residue名字叫什么，只要能在backward.py和Mapping力场参数中能找得到，就可以根据全原子的topol.top中的residue顺序列表为output结构的残基重新命名
# if you have new residue type eg. SEP, HSN, TOP, Just follow next steps:
	1. add the name to backward.py eg. SEP
	   AminoAcids    = "ALA CYS ASP GLU PHE GLY HIS ILE LYS LEU MET ASN PRO GLN ARG SER THR VAL TRP TYR ACE NH2 SEP".split()
	2. create a new file sep.amber.map
[ molecule ]
SEP

[ martini ]
BB SC1 SC2

[ mapping ]
amber

[ atoms ]
    1     N    BB
    2    HN    BB
    3    CA    BB
    4    HA    BB
    5    CB   SC1 BB BB
    6   HB1   SC1 BB BB
    7   HB2   SC1 BB BB
    8    OG   SC1 SC1 BB
    9     C    BB
   10     O    BB
   11    P1   SC2
   12    O1   SC2
   13    O2   SC2
   14    O3   SC2

[ chiral ]
  CB     CA    N    C
  HB1    CA    N    C
  HB2    CA    N    C

[ chiral ]
  HA     CA    N    CB    C ; L-Ser
; HA     CA    N    C    CB ; D-Ser

