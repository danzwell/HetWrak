# Het Wrak

> **Blue Stack wervingsoefening / hiring exercise.**
> Dit is oefenmateriaal van [Blue Stack](https://bluestack.nl), geen productiecode. `main` is met opzet kapot. Een pull request met een fix is de inzending; die mergen we niet naar `main`. Zie [CONTRIBUTING.md](CONTRIBUTING.md). Licentie: [MIT](LICENSE).
>
> This is practice material from [Blue Stack](https://bluestack.nl), not production code. `main` is intentionally broken. A pull request with a fix is the submission; we do not merge it into `main`. See [CONTRIBUTING.md](CONTRIBUTING.md). License: [MIT](LICENSE).

Dit heeft gedraaid. In productie. Bij een klant.

De vorige ploeg is vertrokken en heeft dit achtergelaten: een orderservice op
Kubernetes, met Terraform eromheen. Het deployt niet meer, en toen het nog wel
deployde deed het een aantal dingen die je liever niet doet.

**Repareer wat je vindt en open een pull request.**

Geen Azure-account nodig, geen cluster nodig. Alles is lokaal te controleren.

---

## Wat we hebben zien gebeuren

Vier dingen die het team meldde voordat ze vertrokken:

1. **De pods zijn `Ready`, maar er komt geen verkeer binnen.** De ingress staat
   er, de service staat er, de pods draaien. Toch: niks.
2. **De container start soms helemaal niet:** `CreateContainerConfigError`.
3. **Een node drainen voor onderhoud loopt vast.** Het commando komt nooit terug.
4. **De app kan de database niet vinden.** DNS-lookups lopen in een timeout,
   terwijl de database gewoon bereikbaar is vanaf andere pods.

De CI is rood. Dat is je startpunt, niet je eindpunt: een validator ziet alleen
wat er *kapot* is, niet wat er *onverstandig* is.

> Er zit meer fout dan deze vier symptomen. Wat je nog meer vindt — en waaróm je
> het erg vindt — is precies waar we het meest in geïnteresseerd zijn.

## Lokaal draaien

```bash
./scripts/check.sh
```

Dat draait hetzelfde als de CI:

```bash
terraform -chdir=infra init -backend=false && terraform -chdir=infra validate
kubeconform -strict -summary k8s/
```

`kubeconform` haal je [hier](https://github.com/yannh/kubeconform/releases) — één
binary, geen cluster nodig.

## Wat er in zit

```
infra/     Terraform: resource group, storage, managed identity, roltoewijzing
k8s/       de orderservice: deployment, service, ingress, netwerkbeleid, PDB
scripts/   check.sh — hetzelfde als de CI
```

## Inleveren

1. Fork deze repo
2. Maak een branch
3. Repareer wat je wilt repareren
4. Open een PR naar `main`

Zo'n PR is je inzending. We mergen hem niet; `main` blijft met opzet kapot. Zie [CONTRIBUTING.md](CONTRIBUTING.md).

**Deeloplossingen zijn welkom.** Drie goed onderbouwde fixes zijn interessanter
dan tien commits die alles stilletjes aanpassen. Als je iets ziet maar bewust
laat liggen — te riskant, te weinig context, hoort bij de klant — schrijf dat op.
Dat telt net zo hard mee.

## Waar we naar kijken

Niet of de CI groen wordt. Dat lukt met twee regels.

- **Wat je als eerste pakt.** Alles is stuk; de volgorde zegt iets.
- **Wat je erbij schrijft.** Een fix zonder uitleg is een gok die toevallig klopte.
- **Wat je níet aanraakt, en waarom.** Blast radius is het hele vak.
- **Hoe je het zou zeggen tegen de collega die dit geschreven heeft.** Wij werken
  bij banken en bij de overheid. Gelijk hebben is de helft van het werk.

Je PR-beschrijving weegt hier zwaarder dan je diff.

## En dan?

Een van onze engineers loopt je PR met je door. Geen recruiter, geen assessment,
geen "waar zie je jezelf over vijf jaar". Gewoon dit wrak, en wat jij ermee deed.

Zin in iets korters eerst? [Blue Stack Levels](https://ashy-smoke-0d0e03b03.2.azurestaticapps.net)
— zes eilanden, levels van twee minuten.

---

<sub>Blue Stack · Burgemeester Stramanweg 101, Amsterdam · [bluestack.nl](https://bluestack.nl) · [MIT](LICENSE)</sub>
