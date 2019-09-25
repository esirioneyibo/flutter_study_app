#!/usr/bin/env bash
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i10n/message --no-use-deferred-loading lib/i10n/localization_intl.dart res/values/intl_*.arb
