#!/bin/bash
# HTML report helpers for the phase scripts. Sourced, not executed.

_html_styles() {
  cat <<'CSS'
body { font-family: sans-serif; margin: 30px; background-color: #f4f7f6; }
h1, h2 { color: #2c3e50; }
.section { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); margin-bottom: 30px; }
table { width: 100%; border-collapse: collapse; margin-top: 10px; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
th { background-color: #34495e; color: white; }
tr:nth-child(even) { background-color: #f9f9f9; }
.val-text { color: #27ae60; font-weight: bold; }
.status-warn { color: #f39c12; font-weight: bold; }
.pass { color: #27ae60; font-weight: bold; }
.fail { color: #e74c3c; font-weight: bold; }
.footer { margin-top: 20px; font-weight: bold; font-size: 1.2em; }
CSS
}

# Args: file_path title
html_init() {
  local file="$1"
  local title="$2"
  {
    echo '<!DOCTYPE html>'
    echo '<html>'
    echo '<head>'
    echo '    <meta charset="utf-8">'
    echo "    <title>${title}</title>"
    echo '    <style>'
    _html_styles
    echo '    </style>'
    echo '</head>'
    echo '<body>'
    echo "    <h1>${title}</h1>"
    echo "    <p><strong>Generated:</strong> $(date)</p>"
  } >"$file"
}

# Args: file_path
html_close() {
  local file="$1"
  {
    echo '</body>'
    echo '</html>'
  } >>"$file"
}
