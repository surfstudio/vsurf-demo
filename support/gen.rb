require 'fileutils'
require 'optparse'
require 'liquid'

template = nil
object_name = nil
module_name = nil
output_file = nil

OptionParser.new { |opts|
	opts.banner = "Использование: #{$0}"
	opts.on('-t', '--template TEMPLATE_FILE_PATH', 'Путь к шаблону *.liquid') { |temlate_file_path|
		template = File.open(temlate_file_path).read()
	}
	opts.on('-n', '--name NAME', 'Имя генерируемого объекта') { |arg|
		object_name = arg
	}
	opts.on('-m', '--module MODULE', 'Имя модуля генерируемого объекта') { |arg|
		module_name = arg
	}
	opts.on('-o', '--output_file OUTPUT_FILE_PATH', 'Путь к файлу для сохранения результата') { |arg|
		output_file = arg
	}
	opts.on_tail('-h', '--help', 'Показывает эту справку') {
		puts opts
		exit 1
	}
}.parse!

puts "Загрузка шаблона ⏳"

@template = Liquid::Template.parse(template) 
palette = @template.render('name' => object_name, 'module' => module_name)

puts "Создание файла 🛠"

if output_file.nil?
	puts "⛔ Ошибка: Параметр OUTPUT_FILE_PATH не должен быть пустым"
	exit
end

dir = File.dirname(output_file)
unless File.directory?(dir)
	FileUtils.mkdir_p(dir)
end

File.write(output_file, palette)

puts "Готово ✅"