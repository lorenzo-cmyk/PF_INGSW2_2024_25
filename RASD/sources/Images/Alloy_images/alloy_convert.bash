#requires graphviz
start=1
end=5

for i in $(seq $start $end); do
	dot -T pdf "Alloy_1-${i}.dot" -o "Alloy_1-${i}.pdf"
done
