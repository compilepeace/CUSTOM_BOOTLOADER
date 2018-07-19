
void dummy() {}

int main()
{
	asm(
		"mov	eax, 0x1\n"
		"mov	ebx, 0x2\n"
		"mov 	ecx, 0x3\n"
		"mov 	edx, 0x4\n"
		"mov	esi, 0x5\n"
		);
}
