
./script_crea_profe.ps1 -login dani -password abc123.. -nome Daniel -apelidos "Medina Méndez" -departamento Informática -email dani@gmail.com

./script_crea_profe.ps1 -login damaso -password abc123.. -nome Dámaso -apelidos "Hernández Crespo" -departamento Informática -email damaso@gmail.com

./script_crea_profe.ps1 -login rosa -password abc123.. -nome Rosa -apelidos "García Fernandez" -departamento Informática -email rosa@gmail.com

./script_crea_profe.ps1 -login cristina -password abc123.. -nome Cristina -apelidos "López Pérez" -departamento Informática -email cristina@gmail.com

./script_crea_profe.ps1 -login mdmachado -password abc123.. -nome "María Jesús" -apelidos "Diéguez Machado" -departamento FOL -email mariajesus@gmail.com

./script_crea_profe.ps1 -login joseramon -password abc123.. -nome "Jose Ramón" -apelidos "Otxoa Vázquez" -departamento FOL -email joseramon@gmail.com

./script_crea_profe.ps1 -login ana -password abc123.. -nome "Ana Montserrat" -apelidos "Valladares Comesaña" -departamento Galego -email ana@gmail.com

./script_crea_profe.ps1 -login lolo -password abc123.. -nome "Manuel" -apelidos "Presas Rúa" -departamento Galego -email lolo@gmail.com

./script_crea_profe.ps1 -login silvia -password abc123.. -nome "Silvia" -apelidos "Pérez" -departamento Matemáticas -email silvia@gmail.com

./script_crea_profe.ps1 -login alex -password abc123.. -nome "Alejandro" -apelidos "Penas Supra" -departamento Matemáticas -email alex@gmail.com

# Facemos que algúns profes sexan profesores de ciclo
Add-ADPrincipalGroupMembership -Identity dani -MemberOf profes-iana
Add-ADPrincipalGroupMembership -Identity dani -MemberOf profes-isna
Add-ADPrincipalGroupMembership -Identity cristina -MemberOf profes-iana
Add-ADPrincipalGroupMembership -Identity cristina -MemberOf profes-iibna
Add-ADPrincipalGroupMembership -Identity mdmachado -MemberOf profes-iana
Add-ADPrincipalGroupMembership -Identity mdmachado -MemberOf profes-idna
Add-ADPrincipalGroupMembership -Identity mdmachado -MemberOf profes-iwna
Add-ADPrincipalGroupMembership -Identity mdmachado -MemberOf profes-iibna