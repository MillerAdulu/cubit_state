run:
	flutter run
	
gen:
	flutter pub get && flutter packages run build_runner build --delete-conflicting-outputs