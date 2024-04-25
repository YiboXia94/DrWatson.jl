![DrWatson](https://github.com/JuliaDynamics/JuliaDynamics/blob/master/videos/drwatson/DrWatson-banner-nobg.png?raw=true)

---

DrWatson是一款**科学项目助手软件**，可以帮助人们管理科研项目（或任何相关项目）。

具体来说，它是一个Julia的程序包，旨在可以更好地整合科研项目，更快、更轻松地实现项目文件的定位与共享；管理文稿、整理已完成的模拟结果和项目源代码。DrWatson有助于项目的复现，并且让这些项目的管理变得容易。

参阅[功能](@ref)部分可以了解DrWatson的功能，或参阅[DrWatson工作流教程](@ref)以获取有关DrWatson如何帮助经典的科研工作流的“速成教学”。[项目描述](@ref)部分阐明了其能够成为真正有助于科研工作流的设计理念。如果您想将DrWatson与其他科研项目管理软件比较，请参阅我们在[参考文献](@ref)中的引用的文献。

您还可以观看2020年在JuliaCon的8分钟DrWatson介绍视频：

```@raw html
<iframe width="560" height="400" src="https://www.youtube-nocookie.com/embed/jKATlEAu8eE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

DrWatson是[JuliaDynamics](https://juliadynamics.github.io/JuliaDynamics/)的一部分，请查看我们的[网站](https://juliadynamics.github.io/JuliaDynamics/)以获取其他更炫酷的项目！

!!! 注意 请在GitHub上给我们点个"Star"！
    如果您喜欢DrWatson，请考虑为这个[GitHub库](https://github.com/JuliaDynamics/DrWatson.jl)点个星。这能够给我们提供该软件收益者的准确数字！

## 安装和更新
DrWatson的安装或更新仅需要您在Julia对话框中输入 `] add DrWatson` 或者 `] up DrWatson`。

!!! info "更新信息"
    DrWatson在更新完成后将显示一条消息，包括重大更改或主要新功能。如果您想禁用这些消息，请在调用命令`using DrWatson` 之前将环境变量`DRWATSON_UPDATE_MSG`设置为`0`。

## 选择DrWatson.jl的诸多理由
您是否曾经有过这样的想法，如：

* 啊啊啊啊，我变更了文件夹路径后 `load` 命令不能用了！
* 等一下。。。我已经运行过这个了吗？
* 我需要再次给算完的模拟建立一个数据结构框架吗？！
* 等等。。。这些实验数据已经处理过了吗？
* 我讨厌一遍遍输入 `savename = "w=$w_f=$f_x=$x.txt"`，难道不能将这一操作自动化吗？
* 我希望只需通过一个命令就可以将所有的模拟结果嵌套进同一个数据格式！
* 是的，您给我发送了您的项目文件，但是运行不了...
* 如果能实现用 `git` 自动同步数据就好了...

DrWatson的出现可以避免类似的糟糕想法, 打消您的诸多顾虑。



## 实现功能
DrWatson 是一个**科研项目助手软件**。以下是它的功能：

* [项目安装 Project Setup](@ref)：采用通用的项目结构和函数，使您能够在任意路径下始终方便地定位您的项目。
* [模拟的自动命名 Naming Simulations](@ref)：一个可靠且确定性强的方案，用于命名和处理您的模拟容器。
* [保存工具 Saving Tools](@ref)：安全地保存和加载数据，将 Git 的 commit ID 标记到您的保存文件中，与不干净的仓库关联时保证数据的安全性等。
* [运行和列出已完成的模拟 Running & Listing Simulations](@ref)：生成表格来记录已运行的模拟/数据、将新的模拟结果添加到表格中、设置批处理的参数容器等。

参阅 [DrWatson 工作流教程](@ref) 页面，可以快速了解所有这些功能。

可以将 DrWatson 的核心功能想象成一座座经由桥梁连接的独立岛屿，如果您不想到达其中某一个岛屿，大可以只利用DrWatson的部分核心功能而不受影响！

DrWatson 的实例展示在 [真实案例](@ref) 页面上。所有这些示例都来自使用 DrWatson 的真实科研项目代码。

请注意，DrWatson **不是数据管理系统**。它也不像是 PkgTemplates.jl 那样的 **Julia 程序包创建工具**，亦不是**程序包开发工具**。


## 关于DrWatson的描述
DrWatson遵循以下原则：

1. **非侵入式**。 DrWatson不需要您遵循严格的使用规则，也不需要为此改变原有的工作和科研方式。此外，DrWatson是基于函数的：您只需要调用一个函数，其他所有内容都会自动生效；您*不需要*创建额外的作用域结构 `struct` 抑或是其他数据类型。此外，您也不必在代码之外做任何事情（例如使用命令行参数或外部软件工具）。
2. **简单化**。 DrWatson提供的功能只是一个基线，您可以根据自己的需求处理项目。这使它更可能被广泛使用，但也意味着您不必“学习”了解DrWatson：所有概念都很简单，一切都容易理解。
3. **功能一致性**。 功能在所有项目中都是相同的，DrWatson提供了一个通用的基础项目结构。
4. **允许增量**。 在项目的初始阶段没有好好规划？想要现有的项目中添加更多文件夹、文件或变量？都可以。
5. **模拟可复现**。 DrWatson旨在使用Git、Julia的软件包管理器和一致的命名方案使您的项目完全可重现。
6. **模块化设计**。 DrWatson具有灵活的模块化设计（参阅[功能](@ref)页面），这意味着您只需使用符合 _您的项目_ 的内容。
7. **通用性**。 DrWatson对您的项目内容毫不关心。它不是针对特定的科学工作流程或特定的科学社区定制的。
8. **科学性**。 DrWatson已经在许多现实世界的科学项目中进行了 beta 测试，并根据科学家的反馈得到了成熟发展。
这就是为什么我们相信DrWatson可以帮助您专注于科学探究，而不必担心项目代码管理的问题。

## 引用
如果您在已发表论文的研究项目中使用了 DrWatson，我们将不胜感激您引用与之相关的论文。本文还将 DrWatson 与其他用于以某种方式辅助科学工作流程的软件进行了比较，并强调了 DrWatson 的独特功能。

```
@article{Datseris2020,
  doi = {10.21105/joss.02673},
  url = {https://doi.org/10.21105/joss.02673},
  year = {2020},
  publisher = {The Open Journal},
  volume = {5},
  number = {54},
  pages = {2673},
  author = {George Datseris and Jonas Isensee and Sebastian Pech and Tamás Gál},
  title = {DrWatson: the perfect sidekick for your scientific inquiries},
  journal = {Journal of Open Source Software}
}
```

或者直接使用DOI：
[![DOI](https://joss.theoj.org/papers/10.21105/joss.02673/status.svg)](https://doi.org/10.21105/joss.02673)


## 其他有用的程序包

### 数值模拟相关
* <https://github.com/baggepinnen/Hyperopt.jl>
* <https://github.com/rafaqz/ModelParameters.jl>


### 高效编程
* <https://github.com/docopt/DocOpt.jl>
* <https://github.com/vtjnash/Glob.jl>


### 笔记软件
* <https://github.com/JuliaLang/IJulia.jl>
* <https://github.com/JunoLab/Weave.jl>
* <https://github.com/fonsp/Pluto.jl>


### 论文、书籍和代码
* <https://quarto.org/docs/computations/julia.html>
* <https://nextjournal.com/>
* <https://github.com/JuliaBooks/Books.jl>


### 说明文档
* <https://github.com/JuliaDocs/Documenter.jl>
* <https://github.com/fredrikekre/Literate.jl>
* <https://github.com/caseykneale/Sherlock.jl>
* <https://github.com/miguelraz/DoctorDocstrings.jl>

### 论文相关
* <https://github.com/Humans-of-Julia/Bibliography.jl>
* <https://github.com/SebastianM-C/PkgCite.jl>


### 编写和调试代码
* <https://junolab.org/>
* <https://github.com/timholy/Revise.jl>
* <https://github.com/JuliaDebug/Debugger.jl>
* <https://github.com/MichaelHatherly/InteractiveErrors.jl>


### 性能指标
* <https://github.com/JuliaCI/BenchmarkTools.jl>
* <https://github.com/timholy/ProgressMeter.jl>
* <https://github.com/KristofferC/TimerOutputs.jl>
* <https://github.com/JuliaDebug/Cthulhu.jl>
* ProfileViews.jl (与VSCode中的`@profview`类似)


### 数据存储
* JLD2.jl
* BSON.jl
* CSV.jl


### 数据管理及数据库
* <https://github.com/helgee/RemoteFiles.jl>
* <https://github.com/JuliaDynamics/CaosDB.jl>
* <https://juliadb.org/>
* <https://github.com/SebastianM-C/StorageGraphs.jl>
* <https://tecosaur.github.io/DataToolkitDocs/>

### 数据表格化
* <https://juliadata.github.io/DataFrames.jl/stable/>
* <https://www.queryverse.org/>

### 文件夹遍历
* Base.Filesystem
* <https://github.com/Keno/AbstractTrees.jl/blob/master/examples/fstree.jl>


### 时间管理
* <https://github.com/oxinabox/ProjectManagement.jl>



## 支持和贡献
有关 DrWatson 的问题可以直接在 GitHub 页面上开一个Issue，或在 Julia 的 Slack 频道 `#helpdesk` 和 `#dynamics-bridged` 中提问。

如果您想要贡献自己的力量，那太好了！请参阅[在线指南](https://github.com/JuliaDynamics/DrWatson.jl/blob/master/CONTRIBUTING.md)。


## 灵感来源
以下是 DrWatson 的最初灵感来源。所有的灵感都是针对特定的范围和功能而设计的，自从最初的构思以来，DrWatson 已经发展成为一个涵盖全过程的科研项目助手。

[https://drivendata.github.io/cookiecutter-data-science/#cookiecutter-data-science](https://drivendata.github.io/cookiecutter-data-science/#cookiecutter-data-science)

[https://discourse.julialang.org/t/computational-experiments-organising-different-algorithms-their-parameters-and-results/10774/7](https://discourse.julialang.org/t/computational-experiments-organising-different-algorithms-their-parameters-and-results/10774/7)

[http://neuralensemble.org/sumatra/](http://neuralensemble.org/sumatra/)

[https://github.com/mohamed82008/ComputExp.jl](https://github.com/mohamed82008/ComputExp.jl
)

[https://sacred.readthedocs.io/en/latest/index.html](https://sacred.readthedocs.io/en/latest/index.html)

[https://experimentator.readthedocs.io/en/latest/](https://experimentator.readthedocs.io/en/latest/)

