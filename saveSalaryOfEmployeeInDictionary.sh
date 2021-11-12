absent=0;
present=1;
partTime=2;

function calculateWorkingHour() {
	case $1 in
		$absent)
		workingHour=0;
		;;

		$present)
		workingHour=8;
		;;

		$partTime)
		workingHour=4;
		;;
	esac
	echo $workingHour;
}

wagePerHour=20;
totalSalary=0;
totalWorkingHour=0

day=0;
while [[ $day -lt 20 && $totalWorkingHour -lt 40 ]]
do
	wHour=$( calculateWorkingHour $((RANDOM%3)) );
	totalWorkingHour=$(($totalWorkingHour + $wHour ));

	if [ $totalWorkingHour -gt 40 ]
	then
		totalWorkingHour=$(( $totalWorkingHour - $wHour ));
		break;
	fi

	salary=$(( $wagePerHour * $wHour ));
	perDaySalary[$day]=$salary;
	totalSalary=$(($totalSalary + $salary));
	((day++));
done

echo "Employee as earned $totalSalary$ in a month (Total working hour : $totalWorkingHour)";

for ((cnt=0;cnt<${#perDaySalary[@]};cnt++))
do
	echo 'Day '$(($cnt+1)) ' = ' ${perDaySalary[$cnt]};
done
