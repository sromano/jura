# encoding: utf-8

careers = ["Analista Universitario de Computación",
"Asistente de Investigación en Física",
"Bachiller Universitario Cs.Atmósfera",
"Dr.UBA(Cs.Atmósfera y los Océanos)",
"Dr.UBA(Cs.Biológicas)",
"Dr.UBA(Cs.Computación)",
"Dr.UBA(Cs.Físicas)",
"Dr.UBA(Cs.Geológicas)",
"Dr.UBA(Cs.Matemáticas)",
"Dr.UBA(Cs.Químicas)",
"Esp.en Biotecnología Industrial",
"Esp.en Bromatología y Tecnología de Alimentos",
"Esp.en Estadística",
"Esp.en Estadística para Ciencias de la Salud",
"Esp.en Exp.de Datos y Desc.de Conocimiento",
"Esp.en Geología Minera",
"Esp.en Higiene y Seguridad en el Trabajo",
"Esp.en Química y Ambiente",
"Lic.Ciencia y Tecnología de Alimentos",
"Lic.Cs.Atmósfera",
"Lic.Cs.Biológicas",
"Lic.Cs.Computación",
"Lic.Cs.Físicas",
"Lic.Cs.Geológicas",
"Lic.Cs.Matemáticas",
"Lic.Cs.Químicas",
"Lic.Oceanografía",
"Lic.Paleontología",
"Licenciatura en Ciencias Naturales",
"Maestría en Bromatología y Tecnología de la Industrialización de los Alimentos",
"Maestría en Ciencias Ambientales",
"Maestría en Exp.de Datos y Desc.de Conocimiento",
"Maestría en Física Médica",
"Prof.Ens.Med.y Sup.Biología",
"Prof.Ens.Med.y Sup.Biología (E)",
"Prof.Ens.Med.y Sup.Física",
"Prof.Ens.Med.y Sup.Matemática"]

careers.each{|c| Career.create(name:c)}

Formula.create(name:"I", text:"¿JURAIS POR DIOS Y POR LA PATRIA SOBRE ESTOS SANTOS EVANGELIOS ARREGLAR VUESTRA CONDUCTA A LOS DICTADOS DE LA MORAL, RESPETAR Y HACER RESPETAR LA CONSTITUCIÓN NACIONAL Y LAS LEYES DICTADAS POR LOS ÓRGANOS CONSTITUCIONALES Y PONER AL SERVICIO DE LA SOCIEDAD Y DE VUESTROS SEMEJANTES EL ARTE Y LA CIENCIA DE VUESTRA PROFESIÓN?\nSI ASÍ NO LO HICIEREIS, DIOS Y LA PATRIA OS LO DEMANDEN")
Formula.create(name:"II", text:"¿JURAIS POR DIOS Y POR LA PATRIA ARREGLAR VUESTRA CONDUCTA A LOS DICTADOS DE LA MORAL, RESPETAR Y HACER RESPETAR LA CONSTITUCIÓN NACIONAL Y LAS LEYES DICTADAS POR LOS ÓRGANOS CONSTITUCIONALES Y PONER AL SERVICIO DE LA SOCIEDAD Y DE VUESTROS SEMEJANTES EL ARTE Y LA CIENCIA DE VUESTRA PROFESIÓN?\NSI ASÍ NO LO HICIEREIS, DIOS Y LA PATRIA OS LO DEMANDEN")
Formula.create(name:"III", text:"¿JURAIS POR LA PATRIA ARREGLAR VUESTRA CONDUCTA A LOS DICTADOS DE LA MORAL, RESPETAR Y HACER RESPETAR LA CONSTITUCIÓN NACIONAL Y LAS LEYES DICTADAS POR LOS ÓRGANOS CONSTITUCIONALES Y PONER AL SERVICIO DE LA SOCIEDAD Y DE VUESTROS SEMEJANTES EL ARTE Y LA CIENCIA DE VUESTRA PROFESIÓN?\NSI ASÍ NO LO HICIEREIS, LA PATRIA OS LO DEMANDE")
Formula.create(name:"IV", text:"¿JURAIS POR VUESTRO HONOR ARREGLAR VUESTRA CONDUCTA A LOS DICTADOS DE LA MORAL, RESPETAR Y HACER RESPETAR LA CONSTITUCIÓN NACIONAL Y LAS LEYES DICTADAS POR LOS ÓRGANOS CONSTITUCIONALES Y PONER AL SERVICIO DE LA SOCIEDAD Y DE VUESTROS SEMEJANTES EL ARTE Y LA CIENCIA DE VUESTRA PROFESIÓN?\NSI ASÍ NO LO HICIEREIS, QUE VUESTRA CONCIENCIA OS LO DEMANDE")