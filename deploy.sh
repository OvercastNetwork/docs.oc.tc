for f in *haml
do
	haml $f > ${f:0:(${#f} - 4)}html
done
