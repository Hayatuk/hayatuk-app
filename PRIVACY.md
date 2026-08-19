# Privacy & data handling

Hayatuk handles personal and sensitive data (contact details, blood type, and
location). This document describes how the **app** treats that data. Operators
who deploy Hayatuk are responsible for their own privacy policy and for the
behavior of the backend.

## What the app collects

| Data | Why | Notes |
|------|-----|-------|
| Name, email, phone | Account + letting a requester and donor coordinate | Phone is shown to the other party only after a request is accepted |
| Blood type | Matching donors to requests | |
| Approximate location | Finding nearby requests / showing them on the map | **Coarsened before leaving the device** (see below) |
| Push (FCM) token | Notifying you about relevant requests | |

## Location privacy

The device's **exact GPS coordinate is never sent to the server**. Before any
network call, coordinates are snapped to a coarse grid
(`lib/core/location/fuzzy.dart`, ~1 km), so the backend only ever stores an
approximate area, not a precise position. The precise coordinate is used only
locally, to center the map.

Location permission is requested at the point of use, and the app degrades
gracefully if it is denied (you can still see the app, just without nearby
results).

## Data sharing

- The app talks only to the backend you configure (`API_URL`) and to Firebase
  (Cloud Messaging). It contains no third-party analytics or ad SDKs.
- A requester's and an accepting donor's phone numbers are exchanged **only**
  after an explicit acceptance, to allow them to coordinate.

## Your control

- You can disable donor mode at any time to stop receiving requests.
- You can delete your account from the profile screen, which removes your data.

## Reporting a privacy or security concern

Please report sensitive issues privately to the maintainer rather than opening a
public issue. Replace this with your preferred contact:
`<contact@hayatuk.org>`.
