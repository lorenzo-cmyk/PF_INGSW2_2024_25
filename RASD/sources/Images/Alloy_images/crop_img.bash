# This script crops the right side of the images in the Alloy_images folder.
start=1
end=5

if [ -z "$1" ]; then
  echo "Usage: $0 <number>"
  exit 1
fi

if ! [[ "$1" =~ ^-?[0-9]+$ ]]; then
  echo "Error: Argument must be a valid number."
  exit 1
fi

px=$1

for i in $(seq $start $end)
do
    pdfcrop --margins "0 0 -${px} 0" Alloy_1-${i}.pdf Alloy_1-${i}.pdf
done