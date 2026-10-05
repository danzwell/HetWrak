# Bijdragen / Contributing

**Blue Stack wervingsoefening / hiring exercise.** Dit is oefenmateriaal van [Blue Stack](https://bluestack.nl), geen productiecode. De branch `main` is met opzet kapot en blijft dat. Antwoorden horen niet in deze repository.

**Hiring exercise.** This is practice material from [Blue Stack](https://bluestack.nl), not production code. The `main` branch is intentionally broken and stays that way. Answers do not belong in this repository.

## Kandidaten / Candidates

1. Fork deze repository. Werk niet op `main` van upstream.
2. Maak een branch.
3. Repareer wat je wilt repareren. Leg in de pull request uit wat en waarom.
4. Open een pull request naar `main`.

Die pull request is je inzending. We beoordelen hem en mergen hem niet. `main` hoort rood te blijven. Een groene branch op je fork is welkom.

Fork this repository, branch, and open a pull request against `main`. That pull request is the submission. We review it and do not merge it. `main` is supposed to stay red.

## Maintainers

Het wrak op `main` is `k8s/`, `infra/`, `scripts/check.sh` en `.github/workflows/ci.yml`. Die paden blijven gelijk aan commit `d533cb7`. Licentie, README en dit bestand mogen wel op `main`, zolang ze het wrak niet repareren.

- Keur een kandidaat-pull-request af, of laat hem open. Merge hem niet als hij het wrak repareert.
- Een documentatie-pull-request mag wel, na deze controle:

```bash
git diff d533cb7 -- k8s infra scripts/check.sh .github/workflows/ci.yml
```

Een lege diff betekent dat het wrak heel is. Wijzig je bewust alleen de CI of `scripts/check.sh`, zonder de oefening te repareren, werk dan de commit in dit bestand bij.

- Deze repository blijft public.
- Force-push `main` niet, behalve bij het herstel hieronder.
- Een answer key, expected diff of uitgewerkte oplossing hoort alleen in de privérepo `bluestack-levels`. Zet die niet in een commit, issue of reviewcommentaar van deze repo.

Branch protection op `main` (geen directe pushes, merge alleen door maintainers) helpt, maar vervangt deze afspraak niet. Draai de diff na elke merge.

### `main` terugzetten

Als een merge het wrak toch repareert:

1. Merge geen verdere pull requests die het wrak repareren.
2. Zoek de laatste commit waar de diff hierboven leeg was. Dat is de kapotte baseline.
3. Zet `main` lokaal terug op die commit en push met `git push --force-with-lease origin main`. Alleen een maintainer, alleen om het wrak te herstellen.
4. Draai de diff opnieuw.
5. Noteer op de teruggedraaide pull request waarom `main` is teruggezet.

Daarna ziet de volgende kandidaat hetzelfde wrak.
