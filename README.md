# The Teleporter
So... You want to quickly move from folder to folder, based on what you nick-named it?
But you find yourself constantly changing aliases, and hate going to bashrc every time?
The Teleporter is for you. 

# Usage
* `cd` to your current work project folder
* Decide you're going to 'nickname' it 'wp' (for work project, duh!)
```
t a wp
```
And it's done.

The next time you want to teleport to your folder, just type 
``` 
t wp
```
and you're magically there! 


Done with this particular work project folder? 
```
t r wp
``` 
from anywhere, and you're ready to name your next work project folder!

## Installation
```
git clone https://github.com/samuelj123/teleporter.git
chmod +x teleporter/teleport.sh
mv teleporter/teleport.sh /home/$USER/.local/bin
rm -rf teleporter
```

Add this to your bashrc
```
alias t='source teleport.sh'
```
And you're done!

