ENTRY(_start)

SECTIONS
{
	. = 0x00;
	.text . :
	{
		_text = . ;
		*(.text) 
		. = 0x4000;
		*(.strings)
		_etext = . ;
	}

	.data . :
	{
		*(.data)
	}

	.bss . :
	{ 
		*(.bss)
	}
}
