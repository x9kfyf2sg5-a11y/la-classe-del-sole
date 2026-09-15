-- La classe del sole: tabella del diario e regole di accesso.
-- Da incollare ed eseguire nel pannello Supabase: SQL Editor > New query > Run.

create table public.voci (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users (id) on delete cascade,
  autore      text not null,
  titolo      text not null,
  testo       text not null,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz
);

alter table public.voci enable row level security;

-- Tutti leggono il diario, anche senza entrare.
create policy "lettura per tutti"
  on public.voci for select
  to anon, authenticated
  using (true);

-- Ognuno scrive solo a proprio nome.
create policy "scrittura proprie voci"
  on public.voci for insert
  to authenticated
  with check (auth.uid() = user_id);

-- Ognuno modifica solo le proprie voci.
create policy "modifica proprie voci"
  on public.voci for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Ognuno elimina solo le proprie voci.
create policy "eliminazione proprie voci"
  on public.voci for delete
  to authenticated
  using (auth.uid() = user_id);
