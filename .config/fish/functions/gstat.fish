# Defined in - @ line 1
function gstat --description alias\ gstat=git\ log\ --all\ --numstat\ --pretty=\"\%H\"\ --author=\"Bachmann\"\ --since=1.year\ \|\ awk\ \'NF==3\ \{plus+=\$1\;\ minus+=\$2\}\ NF==1\ \{total++\}\ END\ \{printf\(\"lines\ added:\ +\%d\\nlines\ deleted:\ -\%d\\ntotal\ commits:\ \%d\\n\",\ plus,\ minus,\ total\)\}\'
	git log --all --numstat --pretty="%H" --author="Bachmann" --since=1.year | awk 'NF==3 {plus+=$1; minus+=$2} NF==1 {total++} END {printf("lines added: +%d\nlines deleted: -%d\ntotal commits: %d\n", plus, minus, total)}' $argv;
end
