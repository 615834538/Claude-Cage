package uilocale

import "testing"

func TestMatchHostDisplayLanguages(t *testing.T) {
	tests := []struct {
		preferred []string
		want      string
	}{
		{nil, "zh-CN"},
		{[]string{"en-US", "de-DE"}, "zh-CN"},
		{[]string{"de-DE", "fr-CA", "ko-KR"}, "fr"},
		{[]string{"ru_RU.UTF-8"}, "ru"},
		{[]string{"zh-Hant-CN"}, "zh-TW"},
		{[]string{"zh-Hans-TW"}, "zh-CN"},
		{[]string{"zh-HK"}, "zh-TW"},
		{[]string{"zh_SG"}, "zh-CN"},
		{[]string{"fa-AF"}, "prs"},
		{[]string{"fa-IR"}, "fa"},
		{[]string{"prs-Arab-AF"}, "prs"},
		{[]string{"ps_PK.UTF-8"}, "ps"},
		{[]string{"ti_ER.UTF-8@saaho"}, "ti"},
		{[]string{"my-MM"}, "my"},
	}
	for _, tc := range tests {
		if got := Match(tc.preferred); got != tc.want {
			t.Errorf("Match(%q) = %q, want %q", tc.preferred, got, tc.want)
		}
	}
}
