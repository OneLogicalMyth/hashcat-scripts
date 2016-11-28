#!/bin/bash

# Variables
RuleDir=./rules # no trailing slash on path!
WordList=$3
HashToCrack=$1
HashType=$2
hashcatbin=/opt/hashcat/hashcat64.bin
ResultFile=./cracked-$1

# start running hashcat dictionary attack
$hashcatbin -m$HashType -a0 -r $RuleDir/combinator.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/best64.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/specific.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/leetspeak.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/toggles1.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/hob064.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/toggles2.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/oscommerce.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/T0XlC-insert_space_and_special_0_F.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/toggles3.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/toggles4.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/T0XlC-insert_top_100_passwords_1_G.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/InsidePro-PasswordsPro.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/toggles5.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/T0XlC-insert_00-99_1950-2050_toprules_0_F.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/T0XlC.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/Ninja-leetspeak.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/InsidePro-HashManager.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/T0XlCv1.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/generated.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/Incisive-leetspeak.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/rockyou-30000.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/d3ad0ne.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/d3adhob0.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/generated2.rule $HashToCrack $WordList
$hashcatbin -m$HashType -a0 -r $RuleDir/dive.rule $HashToCrack $WordList

# output cracked passwords
echo "Hashcat dictionary attack completed, outputing results to '$ResultFile'"
# grep ':' is used to remove the info on the first few lines
$hashcatbin --show -m$HashType $HashToCrack > $ResultFile

# end
