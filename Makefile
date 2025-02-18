
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-30s %s\n" $$help_command $$help_info ; \
	done

fresh: ## Runs `clean`, `codegen-build`, and `generate-intl` for a fresh setup.
	make codegen-root

pubget-leapv:
	(flutter pub get;)

codegen-root:
	(flutter clean;flutter pub get;dart run build_runner build --delete-conflicting-outputs)

codegen-build:
	dart run build_runner build --delete-conflicting-outputs

codegen-watch:
	(dart run build_runner watch --delete-conflicting-outputs)

pub-run:
	dart run build_runner build --delete-conflicting-outputs

clean: ## Cleans Flutter project.  dart run build_runner build --delete-conflicting-outputs
	rm -f pubspec.lock
	rm -f ios/Podfile.lock
	flutter clean
	flutter pub get
	cd ios && pod repo update && pod install && cd ..
	dart run build_runner build --delete-conflicting-outputs
	
analyze: ## Runs `flutter analyze`.
	flutter analyze

format: ## Formats dart files.
	dart format .

test: ## Runs unit tests.
	flutter tes

run: ## Runs app
	flutter run

appbundle-dev: ## Builds appbundle
	flutter build appbundle --flavor=dev --target=lib/app/flavors/main_dev.dart

appbundle-prod: ## Builds appbundle
	flutter build appbundle -t lib/app/flavors/main_prod.dart  --flavor prod

apk-dev: ## Builds apk
	flutter build apk --flavor=dev --target=lib/app/flavors/main_dev.dart --split-per-abi

ipa-dev: ## Builds ipa
	flutter build ipa --flavor=dev --target=lib/app/flavors/main_dev.dart

encode-stg-env: ## Encode qa .env file to base64 string
	base64 -i assets/env/stg.env -o encodedStgEnvBase64.txt

encode-prod-env: ## Encode prod .env file to base64 string
	base64 -i assets/env/prod.env -o encodedProdEnvBase64.txt

encode: ## Encode all .env files to base64 string
	make encode-stg-env
	make encode-prod-env