echo "Hey user, enter your personal details"
read -p "Enter your name " name
read -p "Enter your gender [F/M] " gender
read -p "Enter your age " age

read -p "Enter your waist size in cms " waist 
read -p "Enter your height in cms " height 
read -p "Enter your weight in kg " weight 


bmi=$(awk -v w="$weight" -v h="$height" 'BEGIN { print w/((h*1/100)*(h*1/100)) }')
hwr=$(awk -v p="$waist" -v q="$height" 'BEGIN { print p/q }')
echo "According to your input, $name"
echo "Your waist to height ratio is $hwr"
echo "Your Body Mass Index is $bmi"

underweight=$(echo "$bmi<=18.5" | bc)
normal=$(echo "$bmi<=25" | bc)
overweight=$(echo "$bmi<=30" | bc)
obese_1=$(echo "$bmi<=35" | bc)
obese_2=$(echo "$bmi<=40" | bc)
obese_3=$(echo "$bmi>40" | bc)


if [ $underweight -eq 1 ]
then 
	echo "$name, You're underweight."
elif [ $normal -eq 1 ]
then 
	echo "$name, You're healthy."
elif [ $overweight -eq 1 ]
then 
	echo "$name, You're overweight."
elif [ $obese_1 -eq 1]
then
	echo "$name, You are overweight and at a little risk of getting obese."
elif [ $obese_2 -eq 1]
then
	echo "$name, You are overweight and at risk of getting obese."
else 
    echo "$name, You are overweight and at a high risk of getting obese"
fi
