# La classe del sole — diario condiviso

Un diario condiviso per circa 15 persone. Chiunque apre il sito legge le pagine;
per scriverne una serve entrare con nome utente e password. Il sito è una sola pagina (`index.html`)
pubblicata su GitHub Pages; utenti e testi stanno su Supabase (piano gratuito).

## 1. Supabase: crea il progetto

1. Vai su https://supabase.com/dashboard e clicca **New project**.
   Nome: `la-classe-del-sole`, regione Europa, scegli una password per il database (non serve più dopo).
2. Aspetta un minuto che il progetto sia pronto.
3. Apri **SQL Editor** (icona nella barra a sinistra) > **New query**,
   incolla tutto il contenuto di `supabase.sql` e premi **Run**.
4. Vai in **Authentication > Sign In / Providers** e nella sezione Email
   **disattiva "Allow new users to sign up"**: così nessuno può registrarsi da solo.
   Disattiva anche "Confirm email" se è attivo.
5. Vai in **Project Settings > API** (oppure **Connect** in alto) e copia:
   - **Project URL** (tipo `https://abcdefgh.supabase.co`)
   - **anon public** key (una stringa lunga che inizia con `eyJ...`)

## 2. Metti i dati in `index.html`

Apri `index.html` e in cima allo script sostituisci:

```js
const SUPABASE_URL = "INCOLLA_QUI_URL";
const SUPABASE_ANON_KEY = "INCOLLA_QUI_ANON_KEY";
```

con i valori copiati. La chiave anon è fatta per stare nel sito: è pubblica e da sola
non permette di leggere o scrivere nulla, perché le regole sono nel database.

## 3. Crea gli utenti

In Supabase vai in **Authentication > Users > Add user > Create new user**.
Per ogni persona:

- Email: la sua email personale
- Password: una password provvisoria da comunicarle
- Spunta **Auto Confirm User**

Nel sito ognuno entra con la propria email e la password. La prima volta il sito
chiede "Come vuoi firmarti?" e da lì in poi usa quel nome sulle pagine.

Per cambiare la password a qualcuno: Authentication > Users > clicca sull'utente > Reset password.
Per cambiare il nome con cui firma: Authentication > Users > clicca sull'utente > User Metadata, campo `nome`.

## 4. GitHub Pages: pubblica il sito

1. Su GitHub crea un repository nuovo, per esempio `la-classe-del-sole`, **pubblico**
   (GitHub Pages sul piano gratuito richiede repository pubblici).
2. Carica `index.html` nel repository (Add file > Upload files).
3. Vai in **Settings > Pages**, sotto "Build and deployment" scegli
   Source: **Deploy from a branch**, Branch: **main** / **/(root)**, poi Save.
4. Dopo un minuto il sito è su `https://x9kfyf2sg5-a11y.github.io/la-classe-del-sole/`

Ogni volta che modifichi `index.html` e lo ricarichi su GitHub, il sito si aggiorna da solo.

## Note

- Supabase mette in pausa i progetti gratuiti dopo circa 7 giorni senza accessi.
  Se succede, basta riattivarlo dal pannello (Restore project).
- Le regole nel database fanno sì che chiunque legga, ma solo chi è entrato scriva,
  e ognuno possa modificare o eliminare solo le proprie pagine.
- Dominio personalizzato: se un giorno volete `laclassedelsole.it`, si compra (circa 10 €/anno)
  e si collega in Settings > Pages > Custom domain.
