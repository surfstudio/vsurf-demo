
## Project-iOS

## Initialization
##
## Блок команд, которые необходимо запускать при старте работы с проектом
##

init: ## Команда для инициализации проекта, выполняйте всегда перед первым стартом!
	$(MAKE) install.gems
	$(MAKE) install.brews
	$(MAKE) install.hooks
	$(MAKE) apps

install.gems: ## Установит Bundler и гемы
	if ! gem spec bundler > /dev/null 2>&1; then\
		echo "bundler gem is not installed!";\
		sudo gem install bundler -v "2.4.13";\
	fi
	bundle config set path '.bundle'
	bundle install

install.brews: ## Установит утилиты
	brew bundle --no-upgrade

install.hooks: ## Установит хуки
	mkdir -p .git/hooks
	$(MAKE) install.hook name=pre-commit
	$(MAKE) install.hook name=prepare-commit-msg
	$(MAKE) install.hook name=post-checkout
	$(MAKE) install.hook name=commit-msg

install.hook: ## Установит конкретный хук
              ## Пример: `make install.hook name=pre-commit`
	chmod +x support/hooks/$(name)
	ln -s -f ../../support/hooks/$(name) .git/hooks/$(name)

## PROJECT GENERATION
##

apps: ## Создаст все проекты
	$(MAKE) demo.app

demo.app: ## Создаст проект Demo
	cd Modules/App/Demo; xcodegen generate

##  MAIN
##

build: ## Выполняет сборку проекта с помощью fastlane
	bundle exec fastlane build clean:true

test: ## Команда для запуска тестов (выполнять после прохождения `make build`)
	bundle exec fastlane tests

## CODE GENERATION
##

module.app: ## Создаст заготовку под App модуль c Launch и a11y тестами
## Пример: `make module.app name=MyModule`
	bundle exec ruby support/gen.rb -t support/templates/App/app.liquid -n $(name) -o Modules/App/$(name)/Sources/$(name)App.swift
	bundle exec ruby support/gen.rb -t support/templates/App/project.liquid -n $(name) -o Modules/App/$(name)/project.yml
	cp support/templates/App/ContentView.swift Modules/App/$(name)/Sources/ContentView.swift
	mkdir -p Modules/App/$(name)/$(name).docc/Resources/Images
	bundle exec ruby support/gen.rb -t support/templates/App/readme.liquid -n $(name) -o Modules/App/$(name)/$(name).docc/README.md
	mkdir -p Modules/App/$(name)/Tests/UI
	cp support/templates/App/AcessibilityTests.swift Modules/App/$(name)/Tests/UI/AcessibilityTests.swift
	cp support/templates/App/LaunchTest.swift Modules/App/$(name)/Tests/UI/LaunchTest.swift


reusable.view: ## Создаст заготовку под Reusable SwiftUI.View с Snapshot-тестами в Library модуле
               ## Пример: `make reusable.view name=MyView`
	bundle exec ruby support/gen.rb -t support/templates/view.liquid -n $(name) -o Modules/Middle/Library/Sources/Library/Reusable/$(name)/$(name).swift
	bundle exec ruby support/gen.rb -t support/templates/snapshot-test.liquid -n $(name) -m Library -o Modules/Middle/Library/Tests/LibraryTests/Components/$(name)Tests.swift

flow.group: ## Создаст заготовку под Flow модуль с отдельным state модулем, navigationState
            ## Snapshot тестом титульной View во Flow модуле
            ## Пример: `make flow.group name=MyFlowModule`
	mkdir -p Modules/Flows/$(name)/$(name)State; cd Modules/Flows/$(name)/$(name)State; swift package init --type library
	bundle exec ruby support/gen.rb -t support/templates/Flow/state-package.liquid -n $(name) -o Modules/Flows/$(name)/$(name)State/Package.swift
	bundle exec ruby support/gen.rb -t support/templates/Flow/view-package.liquid -n $(name) -o Modules/Flows/$(name)/$(name)Flow/Package.swift
	bundle exec ruby support/gen.rb -t support/templates/Flow/viewgroup.liquid -n $(name) -o Modules/Flows/$(name)/$(name)Flow/Sources/$(name)Flow/$(name)ViewGroup.swift
	bundle exec ruby support/gen.rb -t support/templates/Flow/navigationstate.liquid -n $(name) -o Modules/Flows/$(name)/$(name)Flow/Sources/$(name)Flow/$(name)NavigationState.swift
	mkdir -p Modules/Flows/$(name)/$(name)Flow/Tests/$(name)FlowTests/
	touch Modules/Flows/$(name)/$(name)Flow/Tests/$(name)FlowTests/$(name)Tests.swift

flow.view: ## Создаст заготовку под SwiftUI.View с Snapshot-тестами в Flow модуле
           ## Пример: `make flow.view name=MyView module=MyModule subPath=SomeAdditionalPath` Где subPath это путь после Sources и Tests
	bundle exec ruby support/gen.rb -t support/templates/view.liquid -n $(name) -o Modules/Flows/$(module)/$(module)Flow/Sources/$(module)Flow/$(subPath)/$(name)/$(name).swift
	bundle exec ruby support/gen.rb -t support/templates/snapshot-test.liquid -n $(name) -m $(module) -o Modules/Flows/$(module)/$(module)Flow/Tests/$(module)FlowTests/$(subPath)/$(name)Tests.swift


## SUPPORT
##

lint: ## Команда для запуска линтеров (swiftlint, jscpd, etc.)
	support/swiftlint.sh .

format: ## Команда для запуска форматтера (swiftformat)
	support/swiftformat.sh .

swiftgen: ## Выполняет запуск скриптов SwiftGen для генерации type-safe обертки над ресурсами проекта
	swiftgen --config ./Modules/Core/Resources/swiftgen.yml

AWK := awk
help: ## Показывает все возможные команды в данном MakeFile-е
	@printf "\nUsage: make <command>\n\n"
	@grep -F -h "##" $(MAKEFILE_LIST) | grep -F -v grep -F | sed -e 's/\\$$//' | $(AWK) 'BEGIN {FS = ":*[[:space:]]*##[[:space:]]*"}; \
	{ \
		if($$2 == "") \
			printf "\n"; \
		else if($$0 ~ /^#/) \
			printf "\033[36m%s", $$2; \
		else if($$1 == "") \
			printf "     %-20s%s\n", "", $$2; \
		else \
			printf "    \033[32m%-20s\033[0m %s\n", $$1, $$2; \
	}'




# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)
