# experiments/ - 实验目录

> **所有实验按"一次一目录"组织，每个目录必须有"四件套"。**

## 四件套（缺一不可）

```
experiments/
└── 2026-09-07-exp01-baseline/   ← 目录命名：日期-编号-主题
    ├── config.yaml              ← 全部超参与配置
    ├── run.sh                   ← 一条命令复现的脚本
    ├── results.md               ← 表格 + 关键图 + 三句话结论
    └── commit.txt               ← 跑实验时的代码 commit hash
```

### config.yaml

记录这次实验所有可配置的参数（学习率、batch size、数据路径、模型版本等），让别人**不用读代码**就知道跑了什么。

### run.sh

```bash
#!/usr/bin/env bash
set -euo pipefail
# 一条命令跑完整个实验
python src/xxx/train.py --config experiments/2026-09-07-exp01-baseline/config.yaml
```

### results.md

```markdown
# 结果摘要

## 关键指标
| 指标 | 数值 | 对照组 |
|---|---|---|
| Accuracy | 0.812 | 0.764 (上轮) |

## 结论
- 结论 1
- 结论 2
- 失败/异常点

## 图表
![loss_curve](loss_curve.png)
```

### commit.txt

```bash
# 写本次实验所用代码的 commit hash
git rev-parse HEAD
```

## SUMMARY.md（每个仓库维护一张总表）

在 `experiments/SUMMARY.md` 维护所有实验一行汇总，**论文里的结果表从这里直接复制**。

```markdown
# 实验总表

| 实验编号 | 日期 | 主题 | 关键指标 | 结论 |
|---|---|---|---|---|
| exp01 | 2026-09-07 | baseline | Acc 0.764 | 起点 |
| exp02 | 2026-09-10 | 加 attention | Acc 0.812 | +0.048 |
```

## 重要约定

- **失败的实验也要合并进主干**——负结果是最容易丢的资产
- 大文件（checkpoint、原始日志）不进 git，放外部存储，`results.md` 里记录路径和 md5
- 修改 `src/` 后必须重新跑对照实验，并在 SUMMARY.md 追加新行
