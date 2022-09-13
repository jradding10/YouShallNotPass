# YouShallNotPass
A Basys 3 digital lock box created by Jacqueline R and Carter O

## About the Project
	You Shall Not Pass is a digital lockbox that accepts inputs ranging from 0-7 from three switches that represent the three bits necessary for inputting the numbers 0-7. It accepts three such 3-bit inputs and saves them as a password. When these three inputs are correct and in the right sequence, the Basys 3 board’s seven segment display says “Open.” The seven segment will say “Nope” when the three bit passwords are entered incorrectly. The inputs to the device include D, the input switches; EN, the enter button; and create, the create password switch. Pressing the enter button stores a user’s input in a register, then advances the user to the next digit in the password through a finite state machine that activates the registers in succession. LEDs on the Basys board also turn on in sequence as the enter button is pressed to indicate how many password digits the user has inputted. The create switch allows the user to toggle between the two sets of registers: the password-setting registers or the password-guessing registers.
	When the create switch is on, the password-setting registers (the “set registers”) are enabled, allowing the user to set the password on the device. When the create switch is off, the password-guessing registers (the “enter registers”) are enabled, which allows the user to enter the predetermined password. The comparator module compares the values of each corresponding pair of enter and set registers, outputting a 1 if all three enter registers match their corresponding set registers and outputting 0 in all other cases. The lockbox will only open if the output value from the comparator is 1, indicating that the user inputted all three password digits correctly.
	In a practical application, the “create” switch would be hidden on the inside of the lockbox so that the password can only be changed by a user who knows the current set password.

## Structural Diagram

![alt text](https://github.com/jradding10/YouShallNotPass/blob/main/diagrams/ysnp_struct_d.JPG)

Please refer to the final project report for the schematic.
