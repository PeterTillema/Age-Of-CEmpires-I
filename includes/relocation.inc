#macro relocate1()
	#ifdef old_addr
		.echo >> relocation_table1.asm "\t.dl ",$ - new_addr + old_addr - 3,"\n"
	#else
		.echo >> relocation_table1.asm "\t.dl ",$-3,"\n"
	#endif
#endmacro
#define .r1 relocate1()

#macro relocate2()
	#ifdef old_addr
		.echo >> relocation_table2.asm "\t.dl ",$ - new_addr + old_addr - 3,"\n"
	#else
		.echo >> relocation_table2.asm "\t.dl ",$ - 3,"\n"
	#endif
#endmacro
#define .r2 relocate2()

#macro relocate3()
	#ifdef old_addr
		.echo >> relocation_table3.asm "\t.dl ",$ - new_addr + old_addr - 3,"\n"
	#else
		.echo >> relocation_table3.asm "\t.dl ",$ - 3,"\n"
	#endif
#endmacro
#define .r3 relocate2()

#macro relocate(addr)
	#define old_addr eval($)
	.org addr
	#define new_addr eval($)
#endmacro

#macro endrelocate()
	.org $-new_addr+old_addr
	#undefine old_addr
	#undefine new_addr
#endmacro

.echo >> relocation_table1.asm "RelocationTable1:\n"
.echo >> relocation_table2.asm "RelocationTable2:\n"
.echo >> relocation_table3.asm "RelocationTable3:\n"