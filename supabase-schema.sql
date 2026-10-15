-- Run this in the Supabase SQL Editor.
create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text not null unique,
  user_id uuid not null references auth.users(id) on delete cascade,
  customer_email text,
  amount integer not null check (amount >= 0),
  items jsonb not null default '[]'::jsonb,
  status text not null default 'Payment screenshot pending',
  created_at timestamptz not null default now()
);

alter table public.orders enable row level security;

create policy "Customers can view their own orders"
  on public.orders for select
  to authenticated
  using (auth.uid() = user_id);

create policy "Customers can create their own orders"
  on public.orders for insert
  to authenticated
  with check (auth.uid() = user_id);
