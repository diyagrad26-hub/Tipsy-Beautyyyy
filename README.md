# Tipsy Beauty

A static storefront ready for Vercel, with Supabase Auth and authenticated order records. The catalog, cart, wishlist, shade finder, and local order confirmations work without a backend connection. Checkout currently presents a manual UPI payment flow; the confirmation button is a demo simulation and does not verify or charge a payment.

## Supabase setup

1. Create a Supabase project.
2. Run the SQL in supabase-schema.sql using the Supabase SQL Editor.
3. In supabase-config.js, set SUPABASE_URL and SUPABASE_ANON_KEY from Project Settings > API. The anon/publishable key is intended for the browser. Never use a service-role key here.
4. Enable Email auth and the Google and Apple providers in Authentication > Providers. Add the deployed Vercel domain to Supabase Authentication > URL Configuration > Redirect URLs.
5. Deploy the project root as a static site. No build command or install step is required.

When signed in, order records are stored under the authenticated user's account. Signed-out demo orders stay in that browser's local storage. Configure the real UPI merchant account and verify payments before treating a simulated confirmation as a paid order.

## Deploy to Vercel

Import this project into Vercel with the root directory set to the project root. Select Other as the framework preset, leave the build command empty, and use the project root as the output directory. vercel.json contains the static-site headers. Alternatively, from the project root, run the Vercel CLI and follow its prompts.
