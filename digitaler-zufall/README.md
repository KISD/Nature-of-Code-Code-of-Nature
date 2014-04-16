# Digitaler Zufall 

_Hannes Jung_

<img src="img1.jpg" style="width: 48%;"> <img src="img2.jpg" style="width: 48%;">


>„Die physikalische Forschung hat klipp und klar bewiesen, dass zum mindesten für die erdrückende Mehrheit der Erscheinungsabläufe, deren Regelmäßigkeit und Beständigkeit zur Aufstellung des Postulats der allgemeinen Kausalität geführt haben, die gemeinsame Wurzel der beobachteten strengen Gesetzmäßigkeit – der Zufall ist.“ (Erwin Schrödinger, Antrittsrede an der Universität Zürich 1922)

### Digitaler Zufall 
Es steckt ein wohl dosiertes Maß an Ironie in dem Dilemma des digitalen Zufalls. Sehr viel Energie und Anstrengung wurde von Ingenieuren investiert, um eine Maschine zu bauen, die objektiv ist, die Genauigkeit, Zuverlässigkeit und beliebige Wiederholbarkeit in sich vereint und sicherstellt, die den menschlichen Makel der Subjektivität und des begrenzten Auffasungsvermögens auszugleichen vermag – den Computer. Er soll helfen, die Welt so zu verstehen, wie sie ist, in seiner Binarität frei von von Zweifeln und Ungenauigkeiten, in seiner perfekten Kausalität die absolute deterministische Maschine. Und doch fließt viel Energie in die Versuche, den Zufall in eine ganz und gar unzuffällige Maschine zu integrieren, denn der Zufall hat sich bei der Lösung vieler naturwissenschaftlicher und mathematischer Probleme als unabdingbar erwiesen.

### Kausalität, Determinismus & Kontrolle 
Als determinierte Maschine entworfen, wird der Computer bei gleichem Input jedesmal denselben Output liefern – Das ist, unter anderem, sein Sinn und Zweck. Und nicht nur das: Beruhigenderweise geschieht in einem Computer, im Gegensatz zu der chaotischen Realität, nichts ohne ersichtlichen Grund. Für jeden Effekt gibt es eine Ursache, er ist ein Musterbeispiel an Kausalität. In seiner strikten IF // THEN-Struktur erweist sich der Computer als sehr entgegenkommend, denn zumindest in der westlichen Hemisphäre gibt es im kollektiven Denken eine starke Affinität zu Kausalität. Die Vorstellung, dass nichts ohne Grund passiert, scheint ein Rettungsanker in den scheinbar unendlichen Möglichkeiten der Moderne und den noch vielfältigeren Unsicherheiten der Postmoderne. Ein weitestgehend kausales Weltbild verspricht uns letztendlich die totale Kontrolle über alle Aspekte unseres Daseins – vorausgesetzt wir verstehen die Zusammenhänge in ausreichendem Maße.

Sinnbildlicher Ausdruck für dieses Verlangen ist der Laplacesche Dämon, der von Pierre-Simon Laplace 1814 als Theorie entwickelt wurde. Als theoretisches Fundament liegt ihm ein streng kausales Weltbild zugrunde, dass also der momentane Zustand eines Systems (z.B. des Universums) eine Folge dessen ist, was er im vorherigen Moment war. Würde nun eine Intelligenz, z.B. ein Computer, in der Lage sein, zu einem vorgegebenen Zeitpunkt alle Beziehungen zwischen den Teilen dieses Systems zu erfassen, so könnte sie Orte, Bewegungen und allgemeine Beziehungen zwischen allen Teilen für alle Zeitpunkte in Vergangenheit und Zukunft vorhersagen. Die Weltformel lässt grüßen.

Doch zurück zum Zufall. Lange Zeit wurde auch der Zufall durch die Naturwissenschaften als letztendlich den Gesetzen der Kausalität untergeordnet, also als unzuffällig, betrachtet. Die Naturwissenschaften interpretierten sein Auftreten als in erster Linie bedingt durch “verborgene Ursachen”, die der menschliche Verstand (noch) nicht erkannt hat. Doch seit der Kopenhagener Deutung der Unschärferelation in der Quantenphysik  wird der Zufall als Basis vieler kausal ablaufender Vorgänge allgemein anerkannt. Heruntergebrochen besagt sie, dass in der Quantentheorie nicht für alle Messgrößen gleichzeitig eine exakte Vorhersage möglich ist, sondern nur Wahrscheinlichkeitsaussagen. So ist zum Beispiel der genaue Zeitpunkt des Zerfalls radioaktiven Materials auf Quantenebene nicht vorhersagbar, trotz aller umfassender Kenntnisse der Bedingungen für den Zerfall. Gemeinhin wird dieser Fakt als ein Beweis dafür gewertet, dass auf Quantenebene echter, objektiver Zufall am Werk ist.

Nachdem nun der Beweis für die Existenz echten Zufalls erbracht war, kristallisierte sich heraus, dass viele physikalische Naturkonstanten Ergebnis physikalischer Zufallsprozesse sind. Folgerichtig ist es nicht verwunderlich, dass für die Simulierung dieser Prozesse innerhalb eines Computers der Zufall als Basis unerlässlich ist. Beispiele sind mathematische Optmimierungsverfahren, Simulationsprozesse, Spiele, genetische Algorithmen und, seit PRISM wieder mehr denn je auf der politischen Agenda, kryptographische Methoden zur Verschlüsselung von Daten.

### Simulierter Zufall
Diesem Bedürfnis nach Zufall in digitaler Form ist gar nicht so leicht beizukommen. Per Definition ist echter Zufall innerhalb einer absolut deterministischen Maschine nicht möglich, da in ihr nichts ohne Grund geschieht.  Eigentlich dürfte also nicht einmal die Shuffle-Funktion eines MP3-Players funktionieren. Doch man behilft sich mit einem Trick, den sogenannten Zufalls(zahlen)Generatoren. Hier werden durch mathematische Algorithmen Werte erzeugt, die zufällig erscheinen, oder präziser ausgedrückt: die ab einer gewissen Menge dieselben statistischen Charakteristika von zufälligen Werten zeigen, wie zum Beispiel die Normalverteilung. Faktisch sind diese Zahlen aber nicht zufällig, sondern Ergebnisse komplizierter Rechenoperationen. Ihre Einzigartigkeit gewinnen sie durch eine Variable, die verrechnet wird, beispielsweise die Systemzeit des Computers zum Zeitpunkt der Berechnung. Ist diese Variable bekannt lassen sich die gewonnen Werte reproduzieren, da immer dieselben Algorithmen zu ihrer Berechnung eingesetzt werden. Man spricht deshalb auch von Pseudozufallsgeneratoren.

Für einen Teil der Anwendungen sind diese Pseudozufallszahlen vollkommen ausreichend. Viele naturwissenschaftlichen Berechnungen wie zum Beispiel in den Bereichen der Evolutions- oder Selbstorganisationtheorie kommen mit dem statistischen Zufall gut aus, ihnen ist egal wie er entstanden ist. Andere Anwendungen, allen vorweg die Kryptographie, benötigt “echte” Zufallszahlen. Die Zufälligkeit der verwendeten Werte stellt sicher, dass der Verschlüsselungsalgorithmus nicht erneut von dritten berechnet werden kann und die Verschlüsselung damit gebrochen wird. Diese “echten” Zufallszahlen können idealerweise nur auf der Basis physikalischer Prozesse gewonnen werden, da die mit Hilfe von Algorithmen generierten Zahlen nicht das Ergebnis stochastischer, sondern nur deterministischer Prozesse sein kann. Ein anschauliches Beispiel ist hier das Werfen eines Würfels, auch wenn der Zeitaufwand für die Gewinnung der nötigen Datenmengen dieses Verfahren in der Praxis ausschließt. Physikalische Zufallszahlengeneratoren arbeiten stattdessen auf der Basis von thermischen Rauschen oder dem Zerfall radioaktiver Isotope, die beide echte zufällige Werte erzeugen.
 
Neben dem Zufall als Rechengröße für naturwissenschaftliche und mathematische Modelle existiert aber auch noch eine andere Dimension des Zufalls im Digitalen, die vor allem Gestalter-innen interessieren dürfte: Der Zufall als Quelle des Neuen, als Katalysator der Kreativität. Im Gegensatz zur realen Welt weht selten ein unbeabsichtigter Windstoß über den Desktop der Designerin und bringt die Dokumente und Bilder in neue, aufregende Anordnungen. Niemals wird die Arbeitsfläche einer gängiger Grafiksoftware kippen und alle sorgfältig arrangierten Elemente in inspirierender Weise um ein Quentchen verrutschen lassen. Kein virtuell betrunkener Mitbewohner der Cloud lässt nachts um drei Rotweinflecken auf Entwürfen in InDesign zurück, die sich am nächsten Morgen als ästhetisch verwertbare Elemente einer Infografik zum Alkoholkonsum der Creative Class erweisen. Der Photoshop-Pinsel ist nie verklebt, die Farben reagieren immer genauso miteinander wie es der Blend-Mode vorschreibt, kurz: Der Computer als das Universalwerkzeug der Gestalter-innen schließt den Zufall kategorisch aus. Die analoge Ästhetik des Fehlers und der Unregelmäßigkeiten muss mühsam und bewusst in die digitale Gestaltung reintegriert werden. Unmöglich ist das nicht, Beispiele sind Pseudozufallsgeneratoren die Grunge-Texturen und Distortion-Filter erzeugen. Ihre Anwendung geschieht jedoch ausschließlich vorsätzlich, also eigentlich unzufällig und stellt in erster Linie eine Affirmation an die Ästhetik des Analogen dar und wird meist benutzt, um bestimmte emotionale Bezüge oder historische Einordnungen herzustellen. Neues entsteht auf diesem Weg nicht.

Die Frage, wie der Zufall als analoges Prinzip in den Rechner reintegriert werden kann ist also nicht nur mathematisch-naturwissenschaftlicher, sondern auch ästhetischer Natur. Dementsprechend könnte auch die Erzeugung von Zufallszahlen in einem ästhetischen Verfahren erfolgen, davon ausgehend, dass Erkenntnis auch als ästhetisches Phänomen und Bedürfnis und Kunst und Wissenschaft als komplementäre Formen der Erkenntnissuche verstanden werden.

>„Es entscheidet nicht der reine Erkenntnistrieb, sondern der ästhetische. Die wenig erwiesene Philosophie des Heraklit hat einen größeren Kunstwert als alle Sätze des Aristoteles. Man muss beim Denken schon haben, was man sucht, durch Phantasie – dann erst kann die Reflexion es beurteilen. Es ist jedenfalls etwas Künstlerisches, dieses Erzeugen von Formen. Denken ist ein Herausheben. Vielleicht kann der Mensch nichts vergessen. Die Operation des Sehens und des Erkennens ist viel zu kompliziert, als dass es möglich wäre, sie völlig wieder zu verwischen.“ ((Friedrich Nietzsche, 1872)