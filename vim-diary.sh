#!/bin/bash

#set -x

# Получить время:
function gettime {
	echo $(date +%H:%M:%S)
}

# Установить название папки, файла и всего пути:
dir=$HOME/.diary/$(date +%d.%m.%y)
filename=$(gettime)
fullfile=$dir/$filename

# Узнать текстовый процессор или выбрать vim:
processor=$(printenv EDITOR)
if [ "$processor" = "" ]; then
	processor="vim"
fi

# Аргументы запуска для текстового процессора:
args=""
# Выбрать конфигурацию "diary" для Vim (NeoVim):
# args=$args"-u $HOME/.config/nvim/diary.vim"
# args=$args"-c \":\$\""
#args=$args" -c \":normal G\""
#echo $args
#read

# Создать сегодняшнюю папку, если её нет.
mkdir -p $dir

# Приписать в файл время создания:
# (Уберите, если не надо.)
echo -e "$filename \n\n" >> $fullfile

# Открыть файл в текстовом процессоре:
echo "$processor $fullfile $args"
#read
$processor $fullfile ${args}
# exec xterm -e nvim /home/danil/.diary/05.05.24/16:46:36 -c ":normal G"

# Узнать время выхода из текстового процессора:
endtime=$(gettime)

# Приписать в файл строку с временем выхода:
# (Добавьте ещё "\n", если не хватает.)
echo -e "\n$endtime" >> $fullfile

# Добавить к названию время выхода из редактора:
# (Уберите, если не надо.)
mv $fullfile $dir/$filename\ -\ $endtime

