# Makefile cho project_weather
# Optimized for efficient development workflow

# OS Detection for cross-platform compatibility
ifeq ($(OS),Windows_NT)
    DETECTED_OS := Windows
else
    DETECTED_OS := $(shell uname -s)
endif

# Colors for better output readability
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[1;33m
BLUE := \033[0;34m
NC := \033[0m # No Color

# Helper function to print colored messages
define print_step
	@echo "$(BLUE)🔹 $(1)$(NC)"
endef

define print_success
	@echo "$(GREEN)✅ $(1)$(NC)"
endef

define print_warning
	@echo "$(YELLOW)⚠️  $(1)$(NC)"
endef

define print_error
	@echo "$(RED)❌ $(1)$(NC)"
endef

# Default help target
.PHONY: help
help: ## Show this help message
	@echo "$(BLUE)Weather Project Makefile Commands:$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(YELLOW)%-20s$(NC) %s\n", $$1, $$2}'

# ==============================================================================
# SETUP & INITIALIZATION
# ==============================================================================

.PHONY: bootstrap
bootstrap: ## Initialize project (clean + pub get + build)
	$(call print_step,"Initializing project...")
	@melos clean
	@melos bootstrap
	$(call print_success,"Project initialized successfully")

.PHONY: clean
clean: ## Clean all packages
	$(call print_step,"Cleaning all packages...")
	@melos clean
	$(call print_success,"All packages cleaned")

.PHONY: pub_get
pub_get: ## Get dependencies for all packages
	$(call print_step,"Getting dependencies...")
	@melos bootstrap
	$(call print_success,"Dependencies updated")

# ==============================================================================
# BUILD & CODE GENERATION
# ==============================================================================

.PHONY: build
build: ## Build all packages (freezed, json, injectable)
	$(call print_step,"Building all packages...")
	@melos exec -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"Build completed")

.PHONY: build_watch
build_watch: ## Watch mode for all packages
	$(call print_step,"Starting watch mode for all packages...")
	@melos exec -- "flutter pub run build_runner watch --delete-conflicting-outputs"

.PHONY: build_app
build_app: ## Build only app package
	$(call print_step,"Building app package...")
	@melos exec --scope=app -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"App package built")

.PHONY: build_domain
build_domain: ## Build only domain package
	$(call print_step,"Building domain package...")
	@melos exec --scope=domain -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"Domain package built")

.PHONY: build_data
build_data: ## Build only data package
	$(call print_step,"Building data package...")
	@melos exec --scope=data -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"Data package built")

.PHONY: build_shared
build_shared: ## Build only shared package
	$(call print_step,"Building shared package...")
	@melos exec --scope=shared -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"Shared package built")

.PHONY: sync
sync: clean pub_get build ## Full sync (clean + deps + build)
	$(call print_success,"Full sync completed")

# ==============================================================================
# LOCALIZATION
# ==============================================================================

.PHONY: l10n
l10n: ## Generate localization files
	$(call print_step,"Generating localization files...")
	@melos exec --scope=app -- "flutter gen-l10n"
	$(call print_success,"Localization files generated")

# ==============================================================================
# TESTING
# ==============================================================================

.PHONY: test
test: ## Run all tests
	$(call print_step,"Running all tests...")
	@melos exec -- "flutter test"
	$(call print_success,"All tests completed")

.PHONY: test_app
test_app: ## Run app tests only
	$(call print_step,"Running app tests...")
	@melos exec --scope=app -- "flutter test"
	$(call print_success,"App tests completed")

.PHONY: test_domain
test_domain: ## Run domain tests only
	$(call print_step,"Running domain tests...")
	@melos exec --scope=domain -- "flutter test"
	$(call print_success,"Domain tests completed")

.PHONY: test_data
test_data: ## Run data tests only
	$(call print_step,"Running data tests...")
	@melos exec --scope=data -- "flutter test"
	$(call print_success,"Data tests completed")

.PHONY: test_shared
test_shared: ## Run shared tests only
	$(call print_step,"Running shared tests...")
	@melos exec --scope=shared -- "flutter test"
	$(call print_success,"Shared tests completed")

.PHONY: test_coverage
test_coverage: ## Run tests with coverage
	$(call print_step,"Running tests with coverage...")
	@melos exec --scope=app -- "flutter test --coverage"
	$(call print_success,"Test coverage completed")

# ==============================================================================
# CODE QUALITY
# ==============================================================================

.PHONY: format
format: ## Format all Dart files
	$(call print_step,"Formatting all Dart files...")
	@melos exec -- "dart format . --set-exit-if-changed"
	$(call print_success,"Code formatted")

.PHONY: format_fix
format_fix: ## Format all Dart files (auto-fix)
	$(call print_step,"Auto-formatting all Dart files...")
	@melos exec -- "dart format ."
	$(call print_success,"Code auto-formatted")

.PHONY: analyze
analyze: ## Analyze all packages
	$(call print_step,"Analyzing all packages...")
	@melos exec -- "flutter analyze ."
	$(call print_success,"Analysis completed")

.PHONY: analyze_app
analyze_app: ## Analyze app package only
	$(call print_step,"Analyzing app package...")
	@melos exec --scope=app -- "flutter analyze ."
	$(call print_success,"App analysis completed")

.PHONY: analyze_data
analyze_data: ## Analyze data package only
	$(call print_step,"Analyzing data package...")
	@melos exec --scope=data -- "flutter analyze ."
	$(call print_success,"Data analysis completed")

.PHONY: analyze_domain
analyze_domain: ## Analyze domain package only
	$(call print_step,"Analyzing domain package...")
	@melos exec --scope=domain -- "flutter analyze ."
	$(call print_success,"Domain analysis completed")

.PHONY: analyze_shared
analyze_shared: ## Analyze shared package only
	$(call print_step,"Analyzing shared package...")
	@melos exec --scope=shared -- "flutter analyze ."
	$(call print_success,"Shared analysis completed")

# ==============================================================================
# METRICS & LINTING
# ==============================================================================

.PHONY: metrics
metrics: ## Run dart code metrics for all packages
	$(call print_step,"Running metrics for all packages...")
	@melos exec -- "dart run dart_code_metrics:metrics analyze ."
	$(call print_success,"Metrics analysis completed")

.PHONY: metrics_app
metrics_app: ## Run metrics for app package only
	$(call print_step,"Running metrics for app package...")
	@melos exec --scope=app -- "dart run dart_code_metrics:metrics analyze ."
	$(call print_success,"App metrics completed")

.PHONY: metrics_data
metrics_data: ## Run metrics for data package only
	$(call print_step,"Running metrics for data package...")
	@melos exec --scope=data -- "dart run dart_code_metrics:metrics analyze ."
	$(call print_success,"Data metrics completed")

.PHONY: metrics_domain
metrics_domain: ## Run metrics for domain package only
	$(call print_step,"Running metrics for domain package...")
	@melos exec --scope=domain -- "dart run dart_code_metrics:metrics analyze ."
	$(call print_success,"Domain metrics completed")

.PHONY: metrics_shared
metrics_shared: ## Run metrics for shared package only
	$(call print_step,"Running metrics for shared package...")
	@melos exec --scope=shared -- "dart run dart_code_metrics:metrics analyze ."
	$(call print_success,"Shared metrics completed")

# ==============================================================================
# APP BUILDING & RUNNING
# ==============================================================================

.PHONY: run_dev
run_dev: ## Run app in debug mode
	$(call print_step,"Running app in debug mode...")
	@cd app && flutter run --debug
	$(call print_success,"App started in debug mode")

.PHONY: run_profile
run_profile: ## Run app in profile mode
	$(call print_step,"Running app in profile mode...")
	@cd app && flutter run --profile
	$(call print_success,"App started in profile mode")

.PHONY: run_release
run_release: ## Run app in release mode
	$(call print_step,"Running app in release mode...")
	@cd app && flutter run --release
	$(call print_success,"App started in release mode")

.PHONY: build_apk
build_apk: ## Build APK (debug)
	$(call print_step,"Building debug APK...")
	@cd app && flutter build apk --debug
	$(call print_success,"Debug APK built successfully")

.PHONY: build_apk_release
build_apk_release: ## Build APK (release)
	$(call print_step,"Building release APK...")
	@cd app && flutter build apk --release
	$(call print_success,"Release APK built successfully")

.PHONY: build_ios
build_ios: ## Build iOS app
	$(call print_step,"Building iOS app...")
	@cd app && flutter build ios
	$(call print_success,"iOS app built successfully")

# ==============================================================================
# COMBINED WORKFLOWS
# ==============================================================================

.PHONY: check
check: format analyze test ## Full check (format + analyze + test)
	$(call print_success,"All checks completed successfully")

.PHONY: pre_commit
pre_commit: format analyze ## Pre-commit checks (format + analyze)
	$(call print_success,"Pre-commit checks completed")

.PHONY: ci
ci: clean pub_get build analyze test ## CI workflow
	$(call print_success,"CI workflow completed")

.PHONY: quick_check
quick_check: format_fix analyze_app ## Quick check for app only
	$(call print_success,"Quick check completed")

# ==============================================================================
# UTILITIES
# ==============================================================================

.PHONY: doctor
doctor: ## Run flutter doctor
	$(call print_step,"Running Flutter doctor...")
	@flutter doctor -v
	$(call print_success,"Flutter doctor completed")

.PHONY: upgrade
upgrade: ## Upgrade Flutter and dependencies
	$(call print_step,"Upgrading Flutter and dependencies...")
	@flutter upgrade
	@melos exec -- "flutter pub upgrade"
	$(call print_success,"Upgrade completed")

.PHONY: clean_build
clean_build: ## Clean and rebuild everything
	$(call print_step,"Cleaning and rebuilding everything...")
	@cd app && flutter clean
	@melos clean
	@melos bootstrap
	@melos exec -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"Clean rebuild completed")

# ==============================================================================
# ADDITIONAL UTILITIES
# ==============================================================================

.PHONY: audit
audit: ## Security audit for dependencies
	$(call print_step,"Running security audit...")
	@melos exec -- "flutter pub audit"
	$(call print_success,"Security audit completed")

.PHONY: outdated
outdated: ## Check for outdated dependencies
	$(call print_step,"Checking for outdated dependencies...")
	@melos exec -- "flutter pub outdated"
	$(call print_success,"Outdated check completed")

.PHONY: deps
deps: ## Show dependency tree
	$(call print_step,"Showing dependency tree...")
	@melos exec -- "flutter pub deps"
	$(call print_success,"Dependency tree shown")

.PHONY: install
install: ## Install project (bootstrap + build)
	$(call print_step,"Installing project...")
	@melos clean
	@melos bootstrap
	@melos exec -- "flutter pub run build_runner build --delete-conflicting-outputs"
	$(call print_success,"Project installation completed")

.PHONY: reset
reset: ## Reset project to clean state
	$(call print_step,"Resetting project...")
	@cd app && flutter clean
	@melos clean
	@melos exec -- "flutter pub run build_runner clean"
	@rm -rf app/build
	@rm -rf */build
	@rm -rf */.dart_tool
	@rm -rf */pubspec.lock
	$(call print_success,"Project reset completed")

.PHONY: build_web
build_web: ## Build web application
	$(call print_step,"Building web application...")
	@cd app && flutter build web
	$(call print_success,"Web application built successfully")

.PHONY: build_appbundle
build_appbundle: ## Build Android App Bundle
	$(call print_step,"Building Android App Bundle...")
	@cd app && flutter build appbundle
	$(call print_success,"Android App Bundle built successfully")

.PHONY: run_web
run_web: ## Run app in web browser
	$(call print_step,"Running app in web browser...")
	@cd app && flutter run -d chrome
	$(call print_success,"App started in web browser")

.PHONY: devices
devices: ## List available devices
	$(call print_step,"Listing available devices...")
	@flutter devices
	$(call print_success,"Device list completed")

.PHONY: emulators
emulators: ## List available emulators
	$(call print_step,"Listing available emulators...")
	@flutter emulators
	$(call print_success,"Emulator list completed")

.PHONY: create_emulator
create_emulator: ## Create new Android emulator
	$(call print_step,"Creating new Android emulator...")
	@flutter emulators --create
	$(call print_success,"Emulator creation completed")

.PHONY: logs
logs: ## Show app logs
	$(call print_step,"Showing app logs...")
	@cd app && flutter logs
	$(call print_success,"Logs displayed")

.PHONY: clean_cache
clean_cache: ## Clean Flutter cache
	$(call print_step,"Cleaning Flutter cache...")
	@flutter clean
	@flutter pub cache clean
	@flutter pub cache repair
	$(call print_success,"Flutter cache cleaned")

.PHONY: fix_gradle
fix_gradle: ## Fix common Gradle issues
	$(call print_step,"Fixing Gradle issues...")
	@cd app/android && ./gradlew clean
	@cd app/android && ./gradlew build
	$(call print_success,"Gradle issues fixed")

.PHONY: permissions
permissions: ## Fix file permissions
	$(call print_step,"Fixing file permissions...")
	@chmod +x app/android/gradlew
	@chmod +x *.sh
	$(call print_success,"File permissions fixed")

# ==============================================================================
# DEVELOPMENT SHORTCUTS
# ==============================================================================

.PHONY: dev
dev: sync run_dev ## Quick development setup (sync + run)

.PHONY: fresh
fresh: clean_build run_dev ## Fresh start (clean + build + run)

.PHONY: watch
watch: build_watch ## Start watch mode for code generation

.PHONY: setup
setup: install l10n ## Complete project setup
	$(call print_success,"Complete project setup finished")

.PHONY: release
release: clean pub_get build analyze test build_apk_release ## Full release build
	$(call print_success,"Release build completed")

.PHONY: hotfix
hotfix: format_fix analyze_app test_app ## Quick hotfix workflow
	$(call print_success,"Hotfix workflow completed")

# ==============================================================================
# COMPREHENSIVE WORKFLOWS
# ==============================================================================

.PHONY: full_check
full_check: format analyze test metrics test_coverage ## Comprehensive code quality check
	$(call print_success,"Full quality check completed")

.PHONY: daily_check
daily_check: outdated audit analyze test ## Daily maintenance check
	$(call print_success,"Daily check completed")

.PHONY: weekly_maintenance
weekly_maintenance: upgrade full_check clean_cache ## Weekly maintenance
	$(call print_success,"Weekly maintenance completed")

# Default target
.DEFAULT_GOAL := help
