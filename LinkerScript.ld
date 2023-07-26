/* 
 * File:   LinkerScript.ld
 * Author: Mohamed_Nagy
 * https://github.com/Ged0oo 
 * https://www.linkedin.com/in/mohamednagyofficial/
 * Created on March 20, 2023, 6:41 PM
 */
 
 
 MEMORY
{
	RAM		(xrw)	: 	ORIGIN = 0x22000000, LENGTH = 20K
	FLASH		(rw)	: 	ORIGIN = 0x08000000, LENGTH = 64K
}


SECTIONS
{
	.isr_Vector :
	{
		. = ALIGN(4);
		*(.isr_Vector)
		*(.isr_Vector*)
		. = ALIGN(4);
	} >FLASH
	
	
	.text :
	{
		_textStart = .;
		. = ALIGN(4);
		*(.text)
		*(.text*)
		. = ALIGN(4);
		_textEnd = .;
	} >FLASH
	
	
	.rodata :
	{
		_rodataStart = .;
		. = ALIGN(4);
		*(.rodata)
		*(.rodata*)
		. = ALIGN(4);
		_rodataEnd = .;
	} >FLASH


	.data :
	{
		_dataStart = .;
		. = ALIGN(4);
		*(.data)
		*(.data*)
		. = ALIGN(4);
		_dataEnd = .;
	} >RAM AT> FLASH
	
	
	.bss :
	{
		_bssStart = .;
		. = ALIGN(4);
		*(.bss)
		*(.bss*)
		. = ALIGN(4);
		_bssEnd = .;
	} >RAM 
}
