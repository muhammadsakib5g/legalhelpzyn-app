# CLAUDE.md

Instructions for Claude Code when working in this repository.

## Project Information

**Purpose:** `legalhelpzyn_app` is the client-facing mobile app (Android + iOS) for LegalHelpzyn, a
legal-services firm. Clients use it to browse services, submit and track service requests, upload
documents, pay, and download invoices.

**Current state: scaffold only.** The app is deliberately an empty shell — brand theme, assets, and
a placeholder screen. No feature code has been written yet, because the API it consumes is still
being built. Do not start building screens until the backend reaches Phase 9 (see below).

### Related repositories

| Repo | Path | Purpose |
|---|---|---|
| `legalhelpzyn-app` (this one) | `C:\Projects\legalhelpzyn_app` | Flutter client app |
| `legalhelpzyn` | `c:\laragon\www\legalhelpzyn` | Laravel website, admin panel, and the API this app consumes |

**The app and the website must offer the same client-facing functionality.** Both are clients of
the same `/api/v1` endpoints, backed by the same Laravel Services. If a capability exists on the
website's client portal, it belongs here too — and it must not be reimplemented differently.

The backend is the source of truth for business rules. This app validates input for a good user
experience, but never assumes its own validation is sufficient.

## Brand

Sampled directly from the client logo. Defined once in `lib/theme/brand.dart` — never hardcode a
colour anywhere else.

| Token | Hex | Use |
|---|---|---|
| `BrandColors.orange` | `#FA6704` | Primary actions, accents |
| `BrandColors.navy` | `#084064` | App bar, headings, dark surfaces |

Assets live in `assets/brand/` (`logo.png`, `logo-white.png`, `icon.png`) and are declared in
`pubspec.yaml`. They are copies of the canonical files in the `legalhelpzyn` repo's `public/`
directory — if the brand changes, update there first, then re-copy.

## Tech Stack

- Flutter 3.32 / Dart 3.8, Material 3.
- Android and iOS only (no web/desktop targets — do not add them without being asked).
- Bundle identifier: `com.legalhelpzyn.legalhelpzyn_app`.

## Hard Rules

- **Do not add packages** unless the task genuinely needs one — ask first. A scaffold with a
  20-package dependency list is harder to reason about than one built up deliberately.
- **Do not write feature code before the API exists.** Building screens against an imagined API
  contract produces rework. Wait for Phase 9 of the backend.
- **No secrets, API keys, or signing material in the repo.** Base URLs come from
  `--dart-define`/environment config; keystores stay out of version control.
- Work through the Phase Plan in order. **Finish one phase, then stop and get approval** before
  starting the next.

## Coding Standards

- Everything in `lib/`, organised by feature once features exist:

```
lib/
  main.dart
  theme/          brand colours and ThemeData
  core/           api client, error handling, storage, shared utils
  models/         DTOs mirroring the API resources
  services/       one class per API area, called by the UI layer
  features/
    auth/
    services_catalogue/
    requests/
    invoices/
  widgets/        shared reusable widgets
```

- Prefer `StatelessWidget`; hold state only where it is genuinely needed.
- Widget classes stay small — extract a private widget rather than nesting six levels deep.
- Every network call goes through the shared API client in `core/` — never call `http` directly
  from a widget.
- Models are immutable, with explicit `fromJson` constructors. Do not pass raw `Map` around.
- `flutter analyze` must be clean before any commit.
- Run `dart format .` before committing.

## UI Guidelines

- Material 3, themed from `BrandTheme` — no ad-hoc colours or text styles in widgets.
- Design for small phones first; check that screens survive a 360dp-wide device and large system
  font sizes.
- Every network-backed screen handles all four states explicitly: loading, empty, error (with a
  retry), and content.
- Show real error messages from the API where they are useful; never a bare "Something went wrong"
  when the backend explained the problem.

## Git Guidelines

- Small, focused commits — one logical change each.
- Commit messages explain *why*, not just what.
- Never commit `build/`, `.dart_tool/`, or signing keys.

---

# Phase Plan

The app's phases are gated on the backend. Backend phase numbers refer to the Phase Plan in the
`legalhelpzyn` repo's CLAUDE.md.

### Phase A — Scaffold ✅ done

Flutter project created, brand theme and assets wired in, placeholder screen, repo pushed to
GitHub. `flutter analyze` clean.

### Phase B — App shell *(blocked on backend Phase 9)*

Navigation skeleton, API client with base URL config, error handling, token storage. No screens
beyond structure.

### Phase C — Authentication

Register, log in, log out, password reset, session persistence. Mirrors the website's client-portal
auth exactly, using the same Sanctum-backed endpoints.

### Phase D — Service catalogue

Browse and search the services the firm offers. Service detail screens. Read-only.

### Phase E — Service requests

Submit a request, upload supporting documents, view request status and history. This is the core of
the app and must match the website's portal behaviour exactly.

### Phase F — Billing

View invoices, download invoice PDFs, see payment status. Payment gateway integration follows the
backend's own timeline — the client has confirmed it comes later.

### Phase G — Polish and release

App icons and splash from the brand assets, push notifications if requested, store listings, and
signed release builds.

## Open Questions

- The API contract does not exist yet — endpoint shapes, auth flow details, and pagination style
  all come from backend Phase 9.
- Push notifications: wanted, and if so via which provider? Not yet discussed.
- Minimum supported Android/iOS versions not yet agreed.
