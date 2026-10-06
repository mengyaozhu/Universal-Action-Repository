# Universal Action Repository (UAR)

**Reusable, evolving actions for human–AI task execution.**

**Universal Action Repository (UAR)** is a **growing repository of reusable actions** with specifications for agent discovery and execution. UAR is based on an **action-centered view of task execution** in which actions, rather than skills, tools, models, or particular execution implementations, are treated as the fundamental operational units for accomplishing tasks.

UAR is designed for human–AI collaborative task execution. An action can be executed by an agentic AI, a human, or a human–AI collaborative configuration. The identity of an action is therefore not defined by who performs it, which model performs it, which tool is used, or how it is technically implemented. Instead, an action is defined by the operational activity it represents, the requirements under which it can be performed, and the intended outcome it produces.

The long-term goal of UAR is to provide an **accumulating inventory of reusable actions** that can support a theoretically open-ended range of user-defined tasks. Existing actions can be applied directly when they adequately satisfy a task requirement, or they can be contextualized, integrated, composed, customized, constructed, or engineered when the requirements of a particular task cannot be adequately satisfied by the existing action in its standard form.

## From Tasks to Actions

A task represents a user-defined objective or desired outcome. A task may be sufficiently simple to be accomplished through a single action, or it may be decomposed into multiple subtasks, each representing a distinct operational requirement. In either case, UAR focuses on identifying the action required to accomplish the relevant operational requirement rather than beginning with a predefined set of skills that an agent is assumed to possess.

For a decomposable task, the execution process can therefore be understood as a transformation from task to subtasks and from subtasks to actions. For a non-decomposable task, the task itself may correspond directly to an action. The level at which something is considered a task or a subtask depends on the level of analysis and the execution context. What constitutes a task at one level can constitute a subtask within a larger task at another level.

The central operational relationship is therefore between a **subtask and an action**. Once an appropriate action has been established for a subtask, subsequent executions of the same operational requirement should be able to reuse that action rather than rediscovering an equivalent procedure each time.

## What Is an Action?

An action is a reusable operational unit that directly accomplishes a particular task or subtask. An action specifies what operation is to be performed, the conditions under which it is applicable, the inputs and parameters it requires, the expected output or outcome, and any relevant constraints or execution requirements. An action is intended to provide a relatively well-defined unit of execution that can be identified, retrieved, contextualized, evaluated, and reused independently of the particular performer or implementation.

An action is deliberately distinguished from a skill. A skill is often used broadly as a series of reusable instructions with corresponding contextual information and reference contents, and assume the foundation models' capability can be triggered and applied to produce reliable outcomes when asked to do so. A single skill may contain multiple operational requirements, procedures, and execution dependencies. For example, a skill for producing a research report may instruct an agent to search and retrieve multiple relevant documents, extract and organize the information, perform statistical analysese, generate visualizations, interpre the results, and produce a multi-section report. All of these different actions are packaged as one skill, that represent multiple distinct operational actions with different inputs, outputs, dependencies, evaluation criteria, and potentially different execution requirements. Treating this heterogeneous collection as one fundamental unit can make it difficult to identify which operation is actually being performed well, evaluate its performance independently, reuse only the relevant portion of the capability, or dynamically allocate individual operations to different performers.


Such packaging of multiple operations in a single skill fundamentally overestimate the agent's ability to manage and reliably execute the complete set of required operations. Even if an agent can perform some individual operations reasonably well, this does not establish that it can reliably coordinate a long sequence of heterogeneous operations, maintain the required context and dependencies between them, recognize and recover from intermediate failures, and produce an acceptable final outcome. Errors in one operation can propagate into subsequent operations, while different operations may require substantially different capabilities or execution mechanisms. Consequently, treating the entire collection as one skill can make the task execution to be not stable and the final result not good as expected.

Skill-based execution can also implicitly place substantial responsibility on the underlying foundation model. A skill specification may provide a high-level instruction such as asking a language model to act as an experienced investor and provide investment recommendations, implicitly assuming that the model possesses sufficient domain knowledge, reasoning capability, contextual understanding, and reliability to perform the requested activity accurately. But this kind of implicit LLM capability assumption is both risky and unreliable. If this assumption holds, then we can ask the LLM to do anything through any kind of skill. UAR instead seeks to make the required operations explicit as actions, so that each action can be separately specified, contextualized, executed, evaluated, and, where appropriate, performed by a suitable human, agentic AI, tool, or human–AI configuration.

An action is also distinct from a tool, model, algorithm, or implementation. The same action may be performed using different tools, models, algorithms, procedures, or combinations of human and AI capabilities. For example, an action such as extracting dates from a document can potentially be performed manually, by an AI agent, or through a human–AI collaboration. These different implementations do not necessarily constitute different actions when they realize the same operational requirement and intended outcome.

This distinction also enables actions to be dynamically allocated to different performers. A human, an agentic AI system, a conventional tool, or a human–AI configuration may perform the same action depending on the context, available resources, required quality, cost, reliability, risk, and other application-specific criteria. The framework therefore does not assume in advance that either humans or AI systems are universally better performers. Instead, the suitability of a performer is treated as an empirical and context-dependent property of the execution of a particular action. An action can consequently serve as a stable operational unit even when its performer, implementation, or execution configuration changes over time.

Actions can also be composed into larger executions without losing their individual identities. A complex task may require a sequence or network of actions, where the output of one action provides an input or condition for another. Because each action remains explicitly represented, the resulting execution can be inspected, evaluated, modified, and reconfigured at the action level. If an action is inadequate for a particular context, it can be contextualized or adapted; if no suitable action exists, new actions can be constructed or engineered in the Action Space; and if a newly developed action is sufficiently validated, it can be incorporated into the Action Repository for future reuse.

UAR consequently separates three questions that are often implicitly combined in skill-centered execution: **what needs to be done, who or what should perform it, and how it should be implemented**. The action answers the first question. Performer selection and execution configuration address the second. Tools, models, algorithms, procedures, and human–AI collaboration determine the third. Maintaining these distinctions allows the system to avoid treating the existence of an instruction as evidence of an available capability and instead grounds task execution in explicit operational units whose performance can be independently established and continually improved.

## Action Specifications

An action is represented through an explicit specification rather than being treated as an informal instruction alone. The specification provides the information required for an agent or human collaborator to understand when the action is applicable, what it accomplishes, what it requires, and how it should be executed.

Depending on the action, its specification may describe its purpose, trigger or applicability conditions, inputs, outputs, parameters, preconditions, postconditions, constraints, dependencies, execution procedure, expected results, evaluation criteria, examples, and implementation resources.

The specification is intended to make an action independently understandable and reusable. The same action can therefore be discovered and considered in different task contexts without requiring the original author or execution history to be present.

The current repository uses `action.md` as the primary source of truth for an action. `SKILL.md` is used as a thin discovery wrapper because current agent skill-discovery mechanisms conventionally discover files using that name. This implementation convention does **not** mean that the conceptual unit stored by UAR is a skill. `SKILL.md` provides a compatibility mechanism for discovering an action; `action.md` contains the substantive action specification.

## Action Repository

The **Action Repository** is the persistent collection of established actions. Actions that have been evaluated and verified as sufficiently usable and reusable can be stored and indexed in the repository so that they can be discovered and reused for future task execution.

The repository is therefore intended to function as an accumulating body of operational knowledge. Rather than requiring an agent to construct an appropriate procedure from scratch every time it encounters a task, the agent can first search the repository for an action that corresponds to the relevant task or subtask.

The Action Repository is not intended to be a static catalog. Its contents can expand, evolve, be refined, be generalized, be replaced, or be retired as new evidence and new task requirements emerge. Repository growth is therefore understood as a process of **operational knowledge accumulation**, rather than simply the uncontrolled addition of more files.

Each established action should have a stable identity and sufficient specification to distinguish it from other actions. The repository can consequently serve both as a source of reusable actions and as an indexed record of previously established operational solutions.

## Action Space

The **Action Space** is conceptually distinct from the Action Repository. The Action Repository contains actions that have already been established and accepted into the repository. The Action Space represents the broader environment in which actions can be explored, contextualized, adapted, integrated, composed, constructed, engineered, evaluated, and refined.

The Action Space becomes particularly important when a repository action exists but cannot be directly applied to a particular task because the execution requirements differ from the conditions under which the standard action was originally specified.

In such a situation, the standard action can be retrieved from the Action Repository and brought into the Action Space. The action can then be contextualized or modified to account for the specific task, user requirements, environmental conditions, inputs, constraints, or desired outputs. The resulting contextual action can be executed without necessarily creating a new permanent repository action.

The Action Space is also where new actions can be constructed when no suitable action exists in the repository. Task requirements and contextual requirements can be brought into the Action Space, where existing actions may be combined or transformed, or where a new action can be designed and engineered from the requirements themselves.

The distinction can therefore be summarized conceptually as follows: **the Action Repository represents established operational knowledge, while the Action Space represents the space of operational possibilities and action engineering**.

## Direct Reuse of Existing Actions

When a task or subtask is identified, UAR first provides a basis for searching for a relevant action in the Action Repository. If a suitable action is found and its specification already satisfies the execution requirements of the current task, the action can be retrieved and applied directly.

Direct reuse is the simplest execution path. It avoids unnecessary action construction, reduces repeated procedural discovery, and allows previously established operational knowledge to be transferred across tasks.

The objective is not to construct a new action whenever a task appears. The objective is to reuse an established action whenever that action is sufficiently appropriate.

## Contextualization of Existing Actions

An existing repository action may be relevant to a task but insufficient in its standard form. The task may impose additional contextual requirements, constraints, parameters, formats, environmental conditions, or desired outcomes.

In this case, the standard action is retrieved from the Action Repository and brought into the Action Space for contextualization. Contextualization may involve modifying parameters, adapting execution conditions, integrating additional requirements, combining the action with another action, or otherwise transforming the standard action so that it can satisfy the specific execution requirements of the current task.

Not every contextual modification should produce a new repository action. This distinction is important for preventing unnecessary proliferation of highly similar actions. A contextualized action can remain a task-specific realization of an established action when the underlying operational identity of the action has not meaningfully changed.

## Construction and Engineering of New Actions

When the Action Repository does not contain an action that adequately corresponds to the requirements of a task or subtask, the requirements can be transferred into the Action Space for action construction and engineering.

New actions may be constructed from task requirements, contextual requirements, existing repository actions, combinations of actions, transformations of existing actions, or newly developed procedures. Action engineering may include composition, integration, specialization, generalization, refinement, transformation, parameterization, or other forms of operational modification.

The purpose of action engineering is not simply to generate another instruction. It is to produce an operationally defined action that can satisfy a specific execution requirement and potentially become reusable beyond the original task.

The Action Space therefore provides a mechanism for extending the available action repertoire when the existing Action Repository is insufficient.

## Verification and Promotion

A newly constructed or engineered action does not automatically become part of the Action Repository. Before being promoted, it should be evaluated against appropriate criteria to determine whether it produces the intended outcome and satisfies the relevant execution requirements.

Verification may be based on standard evaluation metrics, task-specific performance criteria, user-defined expectations, successful execution across representative contexts, or other appropriate evidence. The precise evaluation criteria depend on the nature of the action and the task for which it is intended.

When a newly engineered action has demonstrated sufficient usability and reliability, it can be regarded as a verified action and promoted to the Action Repository. The verified action then becomes available for retrieval and reuse in future tasks.

The resulting conceptual cycle is:

**requirement → action exploration or engineering → execution → evaluation → verification → repository accumulation → future reuse**

The important boundary is therefore verification. The Action Space can contain possibilities, adaptations, and candidate actions, while the Action Repository contains actions that have been sufficiently established for reuse.

## Action Accumulation and Evolution

As more tasks are executed, new operational requirements will arise that cannot always be satisfied by the existing action inventory. Successful action construction and engineering can therefore increase the number and diversity of established actions in the Action Repository.

This produces an accumulating repository in which previous task-execution experience becomes reusable operational knowledge. A future task does not necessarily need to repeat the action-engineering process if an appropriate verified action has already been established.

Accumulation does not mean that the repository should grow without control. An increasingly large repository can introduce redundant actions, overlapping actions, excessive specialization, and unnecessary complexity in action selection. For this reason, repository evolution should include periodic review and maintenance.

Existing actions can be compared to identify duplicates or actions that are sufficiently similar to be generalized, merged, refined, replaced, or retired. The objective is not simply to maximize the number of stored actions, but to maintain an action inventory in which each established action provides meaningful and sufficiently distinct operational value.

Repository evolution can therefore involve both **expansion and consolidation**. New verified actions increase the available action repertoire, while deduplication, generalization, refinement, and retirement help control action proliferation and maintain efficient action selection.

## Avoiding Action Explosion

An important design principle of UAR is that contextual variation should not automatically result in the creation of a new repository action.

If every change in task context produced a separate permanent action, the repository could become unnecessarily fragmented. Many actions could differ only by parameters, environmental conditions, output formats, or minor procedural variations while representing essentially the same operational unit.

UAR therefore distinguishes between a standard action, a contextualized realization of that action, and a genuinely new action. Contextualization can occur within the Action Space without permanently expanding the Action Repository when the underlying action remains sufficiently stable.

A new action should be added to the repository when the engineered operation represents a meaningful and reusable operational capability and has been sufficiently evaluated and verified. Periodic deduplication and action generalization can further reduce unnecessary redundancy.

The long-term objective is therefore to develop an action inventory that is **sufficiently comprehensive to support diverse tasks while remaining sufficiently distinct and organized to support effective retrieval and selection**.

## Human and Agentic-AI Execution

UAR is designed for human–AI task execution rather than AI-only execution. An established action may be executed by a human, an agentic AI, or a collaborative configuration involving both.

The action itself remains conceptually separate from its performer. A human and an agentic AI may execute the same action using different procedures or resources while still realizing the same underlying operational requirement.

This separation allows UAR to focus on the action first and determine the appropriate execution configuration separately. The question is therefore not simply which skills an AI agent possesses, but which action needs to be performed and which performer or combination of performers can most appropriately execute that action under the current context.

Performer selection can depend on factors such as execution quality, accuracy, reliability, cost, time, risk, available resources, human effort, accountability, and other task-specific criteria. The appropriate performer can therefore change as the context changes and as human and AI capabilities evolve.

## Actions and Skills

UAR does not reject the concept of skill. Instead, it changes the role that skill plays in task execution.

A skill can be understood as a capability or competency that supports successful performance. Under a skill-centered approach, reusable skills are often treated as the primary units that agents acquire or invoke in order to improve their ability to perform tasks.

UAR proposes a different organization. The primary unit is the **action that must be performed**, while skill can be understood as an emergent or performer-specific property associated with the ability to execute particular actions successfully.

This distinction makes it possible to ask a more direct question during task execution: **What action is required, and how can that action be successfully executed in this context?**

The performer may already possess the capability to execute the action, may require assistance, or may use an external tool or another performer. The action remains the stable operational reference point while the capability and execution configuration can vary.

UAR therefore proposes an **action-centered alternative to skill-centered task execution**, rather than simply creating another collection of skills under a different name.

## Action Identity and Implementation

An action should not be identified solely by its implementation. Different implementations can realize the same action, while the same implementation can potentially support different actions.

For example, an action may be implemented through a script, an API, an AI model, a human procedure, a combination of tools, or a human–AI workflow. The implementation can change while the action remains conceptually stable.

This separation is important for long-term reuse. If action identity were tied to a specific model or tool, changes in technology would require the creation of new actions even when the underlying operational requirement remained unchanged.

UAR instead aims to preserve action identity at the operational level while allowing execution implementations to evolve.

## Action Repository and Action Space as a Continuous Cycle

The Action Repository and Action Space are complementary rather than independent components.

The repository provides established actions to the Action Space when existing operational knowledge can be reused or adapted. The Action Space provides a place for contextualization and engineering when existing actions require modification or when no suitable action exists.

When a contextualized or newly engineered action is sufficiently successful and reusable, it can be verified and promoted back into the Action Repository.

This creates a continuous cycle in which established knowledge supports new task execution, new task requirements stimulate action engineering, successful engineering produces additional operational knowledge, and accumulated knowledge improves future task execution.

The repository therefore represents the **stable and reusable side of the action system**, while the Action Space represents its **adaptive and generative side**.

## UAR and the ARISE Framework

UAR is intended as a concrete repository realization within the broader theoretical direction of **ARISE: An Action-Centered Framework for Human–AI Task Execution**.

Within this framework, the Action Repository and Action Space are two essential concepts. The Action Repository provides persistent storage and indexing for established actions, while the Action Space provides the environment in which actions can be explored, contextualized, constructed, and engineered.

UAR is the repository being developed to operationalize the Action Repository concept. The broader ARISE framework provides the conceptual basis for understanding how tasks, subtasks, actions, action engineering, repository accumulation, and human–AI execution can be organized into a coherent task-execution methodology.

The repository is still in an early stage. Its current implementation should therefore be understood as an evolving realization of these concepts rather than as a complete implementation of the full ARISE framework.

## Current Agent Integration

UAR currently uses an Agent Skills–compatible structure to make actions discoverable by agents that support the relevant discovery mechanism. This is an implementation and interoperability choice rather than a conceptual definition of an action as a skill.

Agents that support skill discovery can discover actions through `SKILL.md`. Agents without that discovery mechanism can still use an action directly by reading its `action.md` and following its specification.

The repository therefore separates the **conceptual identity of an action** from the **technical mechanism used to expose that action to an agent**.

## Repository Layout

```text
<action-name>/
├── SKILL.md       # discovery wrapper: frontmatter + pointer to action.md
├── action.md      # source of truth: trigger conditions, execution, rules, examples
├── scripts/       # executables the action runs
├── references/    # optional: background documents read on demand
├── examples/      # optional: test prompts and expected outputs
└── assets/        # optional: templates and fixtures
```

`SKILL.md` exists primarily for compatibility with current agent skill-discovery conventions. It contains the discovery frontmatter and points to the corresponding `action.md`. The substantive specification of the action is maintained in `action.md`.

`actions.json` provides a machine-readable index of the available actions and is intended to support programmatic discovery and repository management.

## For AI Agents

Clone, install, and restart your agent session:

```bash
git clone <remote-url> universal-action-repository
cd universal-action-repository
./install.sh
```

The default installation target is `~/.agents/skills/`, which is used as a cross-tool discovery directory. A different discovery directory can be specified with `./install.sh --target <dir>`, and `./install.sh --all` can install actions into every supported discovery directory detected on the machine.

Actions are symlinked during installation, so changes pulled into the repository are reflected in the installed actions without requiring a separate copy operation. Because discovery generally occurs at agent session initialization, an agent session should be restarted after installation.

Agents without automatic skill discovery can still use an action directly by reading its `action.md` and following its specification.

## Creating a New Action

A new action should represent a meaningful operational unit rather than merely another name for a task, skill, tool, or implementation. Its specification should make clear what the action accomplishes, when it is applicable, what it requires, what it produces, and how it should be executed and evaluated.

To add an action, create a new action directory using a kebab-case name, provide its `action.md` specification and corresponding `SKILL.md` discovery wrapper, add any required scripts, references, examples, or assets, and register the action in `actions.json`.

As the repository evolves, action specifications and repository organization may also evolve. The current structure is intentionally practical and will be refined as the action inventory and the broader UAR/ARISE methodology develop.

## Available Actions

| Action                                     | Purpose                                                                                                                      | Entry point                                          |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [clone-git-repo](clone-git-repo/action.md) | Clone any remote git repo (HTTPS/SSH) into a local folder, with retries on SSL failure and safe handling of existing folders | [`clone-git-repo/SKILL.md`](clone-git-repo/SKILL.md) |

## Vision

UAR is intended to grow from a collection of individual reusable actions into an evolving repository of operational knowledge for human–AI task execution.

The long-term vision is not to enumerate every possible task in advance, nor to create a separate skill for every task. Instead, UAR seeks to establish reusable action units that can be retrieved and applied when appropriate, contextualized when requirements differ, and constructed or engineered when the existing action inventory is insufficient.

Through repeated execution, evaluation, verification, accumulation, refinement, and deduplication, the repository is intended to become increasingly capable of supporting diverse and theoretically open-ended user-defined tasks while maintaining a manageable and meaningful action inventory.

**From tasks to actions. From established actions to an evolving Action Space. From individual executions to accumulating operational knowledge.**
