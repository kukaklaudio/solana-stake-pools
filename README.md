# Solana Stake Pools Dashboard

Auto-updating dashboard for monitoring Solana validator eligibility across major stake pools.

## 🔗 Live Dashboard

**[View Dashboard](https://kukaklaudio.github.io/solana-stake-pools/)**

## 📊 Features

- Real-time validator eligibility across 16+ stake pools
- Search by validator name, vote account, or identity
- Filter by pool group (SFDP, Jito, Shinobi, etc.)
- Sortable columns (stake, commission, etc.)
- Auto-updates every 2 hours via GitHub Actions

## 🔄 Auto-Update

Data is fetched from [SOFZP/Solana-Stake-Pools-Research](https://github.com/SOFZP/Solana-Stake-Pools-Research) every 2 hours.

## 🙏 Credits

- **Research & Data**: [CryptoVik / SOFZP](https://github.com/SOFZP/Solana-Stake-Pools-Research)
- **Original Dashboard**: [cryptovik.info](http://cryptovik.info/solana-stakepools-dashboard)
- **Checker CLI**: [Solana-Stake-Pools-Checker](https://github.com/SOFZP/Solana-Stake-Pools-Checker)
- **Fork maintained by**: [Superteam Brazil](https://superteam.fun)

## 📁 Structure

```
├── dashboard/          # Static HTML dashboard (deployed to GitHub Pages)
│   └── index.html
├── scripts/            # Data fetching scripts
│   └── fetch-data.sh
├── data/               # Cached stake pool data
│   ├── latest.json
│   ├── manifest.json
│   └── status.json
├── stakepools_list.csv # Pool definitions
└── stakepools-checker.sh  # CLI checker tool
```

## License

MIT — Data sourced from public Solana RPC and SOFZP research.
