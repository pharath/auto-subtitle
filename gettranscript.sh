# Usage: auto_subtitle ~/path/to/file.mp4 --srt_only True

filename="$0"
srtfile="$1"
transcriptfile="$2"

if [ -z "${srtfile}" ]; then
  echo "error: argument srtfile is missing"
  echo " "
  echo "usage: $filename srtfile.srt transcriptfile.txt"
  echo " "
  exit
elif [ -z "${transcriptfile}" ]; then
  echo "error: argument transcriptfile is missing"
  echo " "
  echo "usage: $filename srtfile.srt transcriptfile.txt"
  echo " "
  exit
fi

grep -v ^0 "$srtfile" | grep -v ^$ | awk 'NR % 2 == 0' >> "$transcriptfile"
echo " "
echo "wrote to $transcriptfile."
