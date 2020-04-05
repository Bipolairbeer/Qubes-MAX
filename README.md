#                       				QubesOS with all available templates
#

Start your brand new QubesOS.iso by cloning a Fedora-XX TemplateVM (XX = the current version in QubesOS)

Set private storage at least at 100GB

Clone this repository:

	sudo git clone https://github.com/Bipolairbeer/Qubes-MAX.git /home/user/Qubes-MAX

Change the permission:

	sudo chmod -R 777 /home/user/Qubes-MAX

Go to the Qubes-Max directory:

	cd /home/user/Qubes-MAX/

Run the script:

	./buildmax.sh

Let your machine do the work for you and after finishing just install the new .iso!
