# paper/ - 论文与文档产出

> 这里只放**当前正在写**或**已发表**的论文/报告。**所有图表必须由脚本从 `experiments/` 结果生成**，禁止手工 PS 改图。

## 推荐结构

```
paper/
├── main.tex          # 主文档
├── sections/         # 各章节独立 .tex 文件（多人合写时方便拆 Issue）
├── figures/          # 图片
│   ├── make_fig1.py  # 图表生成脚本
│   └── fig1.pdf      # 脚本生成的产物（不进 git，由 CI 重新生成）
├── tables/           # 表格（通常由 experiments/SUMMARY.md 自动生成）
├── refs.bib          # 参考文献
└── versions/         # 投稿/返修各版本快照
    ├── v1-submit-ICRA/
    └── v2-rebuttal/
```

## 写作流程（与 PR 流程一致）

1. 在 Issues 里拆出"摘要/方法/实验/讨论/某节"等任务卡
2. 每节一个分支 + 一个 PR，**老师用行内评论改稿**，而不是回传 Word
3. 关键提交打 git tag（如 `v1-submit-ICRA`），永远能回到"当时投出去的那一版"

## 版本与 tag

- 第一次投稿：tag `v1-submit-<会议名>`
- 收到评审意见：tag `v1-received-reviews-<会议名>`
- 提交 rebuttal：tag `v1-rebuttal-<会议名>`
- 接收后终稿：tag `v1-final-<会议名>`
