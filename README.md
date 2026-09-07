# 实验室课题仓 Template

> 本仓库是**课题组/实验室的统一项目模板**。
> 任何新课题、新学生、新论文都从这个模板克隆一份，**不必重新搭骨架**，所有人写代码、做实验、写论文都走同一套流程。

## 这是 Template 仓库

打开本仓库页面，绿色 **"Use this template"** 按钮 → 选 **Create a new repository** → 输入你课题的名字（如 `proj-yolo-attention`）→ 你的课题仓就自动有了下面这套骨架、PR 流程、CI 保护。

> 用 Template 方式克隆的仓库是**独立的新仓库**，不会因为本仓库改动而影响你。

## 仓库用途（核心循环）

```
Issue 提出任务 ──► 自己的分支干活 ──► PR 评审 ──► 合并入 main ──► CHANGELOG 留痕
                                  ▲                       │
                                  └─────── Review 反馈 ───┘
```

- 老师**只看板和 PR**，不再微信催、不再组会问进度
- 任何人改 `main` 之前必须有人 Review 通过（main 分支保护）
- 每次合并自动出现在 `CHANGELOG.md` 里，可回溯

## 目录骨架（每个课题仓都是这样）

```
<你的课题名>/
├── README.md                       # 一页说清：问题、方法、当前状态、复现方式
├── CONTRIBUTING.md                 # 协作与审阅规范（来自模板）
├── CHANGELOG.md                    # 迭代日志，每次合并追加一行
├── docs/                           # 设计文档、调研笔记、组会纪要、文献阅读笔记
├── src/                            # 可复用代码（被多个实验/模块调用）
├── experiments/                    # 一次实验 = 一个子目录，必须含四件套
│   ├── SUMMARY.md                  # 论文数字的总表
│   └── YYYY-MM-DD-exp##-主题/
│       ├── config.yaml             # ← 全部超参
│       ├── run.sh                  # ← 一条命令复现
│       ├── results.md              # ← 表格 + 关键图 + 结论
│       └── commit.txt              # ← 跑实验时的代码 commit hash
├── paper/                          # LaTeX 源、图表生成脚本、投稿版本快照
└── .github/
    ├── PULL_REQUEST_TEMPLATE.md    # 发起 PR 时自动填写的模板
    ├── ISSUE_TEMPLATE/             # 实验 / 论文 / Bug 三种任务卡
    └── workflows/ci.yml            # PR 检查：实验四件套 + 标题格式
```

## 快速上手（每位新成员 5 分钟）

1. 点 **Use this template** 克隆本仓到 Organization 下（命名 `proj-<你的课题>`）
2. 把仓库克隆到本地：
   ```bash
   git clone https://github.com/<org>/proj-<你的课题>.git
   cd proj-<你的课题>
   ```
3. 改 `README.md` 写清"我要解决什么问题 / 现在做到哪了 / 怎么跑"
4. 在 Issues 里开第一张任务卡（用 `🧪 实验任务卡` 模板）
5. 建分支干活：
   ```bash
   git checkout -b feat/issue-3-dataloader
   git add . && git commit -m "feat: 新增 dataloader"
   git push -u origin feat/issue-3-dataloader
   ```
6. 打开 GitHub → 你的仓库 → **Compare & pull request** → 选 Issue → 提交
7. 等一位同学/老师 Approve → 自动合并 → CHANGELOG 留痕

详细规则见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 硬规则（缺一不可）

1. 不在 `main` 上直接提交，一律走 PR（main 已开启保护）
2. 实验没有 `config + run.sh + commit hash + results` 四件套，**不算做过**
3. 论文里的每个数字都能回溯到 `experiments/SUMMARY.md` 的某一行
4. 数据、模型权重、密钥不进 git；`.gitignore` 已统一给出
5. 每次合并在 `CHANGELOG.md` 追加一行：日期、类型、做了什么、对应 Issue

## 当前模板状态

- 仓库类型：GitHub Template（已开启 `is_template`）
- 保护：main 禁止直推，至少 1 人 Review 才能合并，管理员不豁免
- 合并后自动删除分支：`delete_branch_on_merge = true`
- CI：基础 PR 检查（实验四件套 + 标题格式），失败仅警告不阻塞
