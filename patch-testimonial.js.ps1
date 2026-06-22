$path = 'index.html'
$lines = Get-Content $path
$insert = @(
    '                                        var testimonialToggles = document.querySelectorAll(''.testimonial-toggle'');'
    '                                        testimonialToggles.forEach(function(toggle) {'
    '                                                var testimonial = toggle.closest(''.testimonial'');'
    '                                                var text = testimonial && testimonial.querySelector(''.testimonial-text'');'
    ''
    '                                                if (!text) return;'
    ''
    '                                                toggle.addEventListener(''click'', function() {'
    '                                                        var expanded = text.classList.toggle(''expanded'');'
    '                                                        toggle.textContent = expanded ? ''Show less'' : ''Read more'';'
    '                                                        toggle.setAttribute(''aria-expanded'', expanded);'
    '                                                });'
    '                                        });'
)
$newLines = $lines[0..454] + $insert + $lines[455..($lines.Length - 1)]
Set-Content $path $newLines
Write-Host 'inserted'