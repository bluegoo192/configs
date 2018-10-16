function fish_title
    if [ $argv ]
        basename $PWD
        echo " | " $argv
    else
        basename (dirname $PWD) '/' $PWD
    end
end
