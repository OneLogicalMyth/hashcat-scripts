# Some Thoughts
I started this repo, purely to dump my thoughts and scripts I have built in cracking passwords.

I tend to use 3 wordlists when cracking passwords, I run the following in order;
* rockyou
* crackstation-human-only
* crackstation

I rename the files with a 2 digit prefix, so the rockyou is renamed to **01-rockyou.txt** and so on. Then in hashcat I simply tell it to use the folder for the wordlist for example;
```
hashcat -m1000 -a0 -r ./rules/hob064.rule hashes-to-crack ./wordlists/
```
This then runs through the wordlists in order of 01, 02 and 03 in my case, making the waiting times slower and slower this eliminating any quick wins first.

After wordlists, I tend to do an 8 char incremental brute force excluding special characters;
```
hashcat -m1000 -a3 -1 ?l?d?u -i hashes-to-crack ?1?1?1?1?1?1?1?1
```
I occasionally get the odd really weak password.


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


# DictionaryAttack.sh
An example usage would be;
```
./DictionaryAttack.sh hashes 1000 ./wordlists/rockyou.txt
```

You will then find a file named **cracked-hashes** if successful.

## Thought process behind the rule ordering
I have ordered the rules in the script based on the [crackstation wordlist](https://crackstation.net/buy-crackstation-wordlist-password-cracking-dictionary.htm), I ran a bunch of NTLM hashes through each rule set and timed the result. Then ordered from quick to slowest. I have a single GTX 1080 in my machine so results might vary, so adjust as you see fit. :)

Here was my results;
* combinator - 1m
* best64 - 1m 27s
* specific - 1m 29s
* leetspeak - 1m 43s
* toggles1.rule - 1m 43s
* hob064 - 2m 6s
* toggles2.rule - 2m 17s
* oscommerce - 2m 15s
* T0XlC-insert_space_and_special_0_F.rule - 3m 58s
* toggles3.rule - 4m 35s
* toggles4.rule - 10m 16s
* T0XlC-insert_top_100_passwords_1_G.rule - 24m 13s
* InsidePro-PasswordsPro - 24m 33s
* toggles5.rule - 26m 20s
* T0XlC-insert_00-99_1950-2050_toprules_0_F - 30m 28s
* T0XlC.rule - 32m 33s
* Ninja-leetspeak - 40m 28s
* InsidePro-HashManager - 1h 5m
* T0XlCv1.rule - 1h 43m
* generated - 1h 46m
* Incisive-leetspeak - 3h 47m
* rockyou-30000 - 4h 8m
* d3ad0ne - 4h 52m
* d3adhob0 - 8h 19m
* generated2 - 10h 6m
* dive - 18h 40m
