echo >path0 'Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
Line 8
Line 9
Line 10
line 11
Line 12
Line 13
Line 14
Line 15
cat >expected <<\EOF
diff --git a/path0 b/path1
rename from path0
rename to path1
--- a/path0
+++ b/path1
@@ -8,7 +8,7 @@ Line 7
 Line 8
 Line 9
 Line 10
-line 11
+Line 11
 Line 12
 Line 13
 Line 14
EOF
test_expect_success 'two files with same basename and same content' '
	git reset --hard &&
	mkdir -p dir/A dir/B &&
	cp path1 dir/A/file &&
	cp path1 dir/B/file &&
	git add dir &&
	git commit -m 2 &&
	git mv dir other-dir &&
	git status | test_i18ngrep "renamed: .*dir/A/file -> other-dir/A/file"
'
