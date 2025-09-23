# 导出 pdf
pdf name:
	pandoc -s "markdown/{{name}}.md" -o "pdf/{{name}}.pdf" --from gfm --css="css/gfm.css" --syntax-highlighting="theme/gfm.theme" --pdf-engine=weasyprint