# maskattack-generator.py
An example use of the script;
 ```
 ./maskattack-generator.py ./input_file_plain_text_passwords > masks.hcmask
 ```
This will store the result in a hashcat mask file format more can be read on this here;<br>
https://hashcat.net/wiki/doku.php?id=mask_attack

To then use it with hashcat you can then issue a command such as;
```
hashcat -m 1000 -a 3 hashes masks.hcmask
```

This will run through each mask in the file until exhausted or all passwords are cracked
