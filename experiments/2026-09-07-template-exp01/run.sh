#!/usr/bin/env bash
# 复现命令示例 —— 真实实验时请替换为你的训练/评测入口
set -euo pipefail

# 切到仓库根目录
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

# 1. 记录本次运行的 commit hash
git rev-parse HEAD > experiments/2026-09-07-template-exp01/commit.txt

# 2. 执行实验（替换为你的真实命令）
echo "TODO: replace with real training command"
echo "Example: python src/train.py --config $1"

# 3. 把结果写到 results.md
echo "Run finished at $(date -Iseconds)" >> experiments/2026-09-07-template-exp01/results.md
