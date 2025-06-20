/*Nos hemos encontrado con que varios usuarios incumplen los términos de servicio y queremos quitarles el acceso a su cuenta. Sin embargo, no queremos 
borrarla directamente, sino marcar la cuenta como “baneada” y darles un tiempo para apelar antes de que se borre definitivamente.

1.Altera la base de datos existente (con una query) para poder indicar los canales baneados de forma eficiente. (1,5 Puntos)

Ten en cuenta que muy pocos canales van a estar baneados. Intenta minimizar el uso de memoria para los canales no baneados.
No rehagais tablas enteras. Queremos que esta modificación sea compatible con otras. Limitad los cambios a las columnas que realmente estais modificando.
Hay que indicar también la Fecha del ban ya que queremos que estas se borren al cabo de unos meses.
Recordad que explicar vuestro razonamiento suele dar puntos.
*/
ALTER TABLE Users
ADD  baneada BIT DEFAULT 0
ALTER TABLE Users
ADD  fecha_ban DATE;

/*
Se crea nuevas columnas en la tabla Users, "Baneada" donde por defecto es 0 cuando no es baneada y 1 cuando es baneada y la columna "Fecha_ban" que es la fecha cuando ha sido baneada.

2.Queremos hacer una vista de Usuarios llamada ValidUsers que solo muestre los Usuarios que no han sido baneados. (0,5 Puntos)

Garantizad la velocidad de esta Vista, la vamos a usar constantemente.
*/

CREATE VIEW ValidUsers 
AS
	SELECT userId, userName, baneada FROM Users
	WHERE baneada = 0


/*
3.Banear no sirve de nada si no restringimos el acceso a los vídeos del usuario, sin embargo, no queremos que los usuarios crean que es un error. 
Para evitarlo, crearemos una vista vVideos para que los vídeos se muestren pero “censurando” los que sean de usuarios baneados. (1 Punto)

En lugar del título real, se mostrará “Video Bloqueado”
En lugar de la descripción, se mostrará “Este video es inaccesible porque su creador ha incumplido los términos de servicio”
El resto de campos permanecerán intactos.
Los videos de usuarios no baneados también han de permanecer intactos.

He alterado la tabla 
*/

ALTER TABLE Videos
ADD UserId INT

ALTER TABLE Videos
	ADD CONSTRAINT FK_Videos_UsersId FOREIGN KEY (UserId)
    REFERENCES Users(UserId)
GO

CREATE VIEW vVideos AS
	SELECT 
    videoId,
	sumvotes,
    numvotes,
    v.userId,
    CASE 
        WHEN u.baneada = 1 THEN 'Video Bloqueado'
        ELSE v.title
    END AS title,
    CASE 
        WHEN u.baneada = 1 THEN 'Este video es inaccesible porque su creador ha incumplido los términos de servicio'
        ELSE v.description
    END AS description
  
FROM videos v
JOIN users u 
ON v.UserId = u.userId