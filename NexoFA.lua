local plr = game.Players.LocalPlayer
local char = plr.Character
local srv = game:GetService("RunService")
local ct = {}
local te = table.insert
local m = plr:GetMouse()
if char:FindFirstChild("Robloxclassicred") then
else
    return
end

_G.Jitter=Vector3.new(-20,0,-20)

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~= 'HumanoidRootPart' then 

te(ct,game:GetService("RunService").Heartbeat:connect(function()
pcall(function()
v.Velocity = _G.Jitter

game.Players.LocalPlayer.ReplicationFocus = workspace
workspace.FallenPartsDestroyHeight = -math.huge
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",9e9)
settings().Rendering.EagerBulkExecution = true
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
settings().Physics.ForceCSGv2 = false
settings().Physics.DisableCSGv2 = true
settings().Physics.UseCSGv2 = false
settings().Physics.ThrottleAdjustTime = math.huge
workspace.InterpolationThrottling = "Disabled"
end)
end))
end
end

char.Archivable = true
fl = Instance.new("Folder", char)
fl.Name = "ArmFling"
local reanim = char:Clone()
char.Humanoid:ChangeState(16)
char.HumanoidRootPart:Destroy()
for i, v in next, char.Humanoid:GetPlayingAnimationTracks() do
    v:Stop()
end
char.Animate:Remove()
hats=0
function create(part, parent, p, r)
hats=hats+1
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name..hats
parent.Attachment.Name = part.Name..hats
part.AlignPosition.Attachment0 = part[part.Name..hats]
part.AlignOrientation.Attachment0 = part[part.Name..hats]
part.AlignPosition.Attachment1 = parent[part.Name..hats]
part.AlignOrientation.Attachment1 = parent[part.Name..hats]
parent[part.Name..hats].Position = p or Vector3.new()
part[part.Name..hats].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignOrientation.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 999999999
end

function Pos(part, parent, p)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part.AlignPosition.MaxForce = 999999999*10
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
end

function nc(p)
if p:IsA('BasePart') or p:IsA('Part') then
te(ct,srv.Stepped:Connect(function()
p.CanCollide=false
end))
te(ct,srv.RenderStepped:Connect(function()
p.CanCollide=false
end))
else
print('Cannot noclip '..p)
end
end

function af()
for i,v in next, game.Players:GetDescendants() do
if v:IsA('Player') and v.Name ~= game.Players.LocalPlayer.Name then
for _,c in next, v.Character:GetDescendants() do
if c:IsA('BasePart') and v.Parent== char then
noo=Instance.new('NoCollisionConstraint',c)
noo.Part1=char['Torso']
noo.Part0=c
noo2=Instance.new('NoCollisionConstraint',c)
noo2.Part1=char['Head']
noo2.Part0=c
end
end
end
end
end

for i, v in next, reanim:GetDescendants() do
    if v:IsA("BasePart") or v:IsA("Decal") then
        v.Transparency = 1
    end
end
for i, v in next, char:GetDescendants() do
    if v:IsA("BasePart") then
        nc(v)
    end
end
for i, v in next, char:GetDescendants() do
    if v:IsA("Accessory") and v.Name ~= "Robloxclassicred" then
        v.Handle:BreakJoints()
        create(v.Handle, reanim[v.Name].Handle)
    end
end
for i, v in next, reanim:GetDescendants() do
    if v:IsA("BasePart") then
        nc(v)
    end
end
for i, v in next, char:GetDescendants() do
    if v:IsA("Motor6D") and v.Name ~= "Neck" then
        v:Destroy()
    end
end
for i, v in next, char:GetDescendants() do
    if v:IsA("BasePart") and v.Name ~= "Right Arm" and v.Name ~= "Head" and v.Parent == char then
        create(v, reanim[v.Name])
    end
end

function fix(p)
fixer=Instance.new('BodyPosition',p)
fixer.Name='BP'
fixer.P=9e9
fixer.D=9e9
fixer.MaxForce=Vector3.new(99999,99999,99999)
end

function flinger(p)
    f = Instance.new("BodyAngularVelocity", p)
    f.P = 9e9 * 10
    f.AngularVelocity = Vector3.new(9e9 * 10, 9e9 * 10, 9e9 * 10)
    f.MaxTorque = Vector3.new(9e9 * 10, 0, 0)
    return f
end
char['Right Arm'].Transparency = 1
Pos(char["Right Arm"], reanim["Torso"])
fix(char['Right Arm'])
fliiiin = flinger(char["Right Arm"])
char["Robloxclassicred"].Handle:BreakJoints()
char["Robloxclassicred"].Handle.Mesh:Destroy()
create(char["Robloxclassicred"].Handle, reanim["Right Arm"], Vector3.new(), Vector3.new(90, 0, 0))
reanim.Animate.Disabled = true
reanim.Parent = fl
sh = false
fp = Instance.new("Part", reanim)
fp.Name = "FlingPart"
fp.CanCollide = false
fp.Transparency = 1
te(ct,m.Button1Down:Connect(function()
sh=true
end))

te(ct,m.Button1Up:Connect(function()
sh=false
end))
te(ct,srv.Heartbeat:Connect(function()
m.TargetFilter = char
            if sh then
                fp.CFrame = CFrame.new(m.Hit.p)
                char["Right Arm"].Position = fp.Position
            else
                fp.CFrame = char.Torso.CFrame * CFrame.new(0, 0, 0)
                char["Right Arm"].Position = fp.Position
            end
end))

local Highlight = Instance.new("SelectionBox")
Highlight.Adornee = char["Right Arm"]
Highlight.LineThickness=0.2
Highlight.Color3 = Color3.fromRGB(30,255,30)
Highlight.Parent = char["Right Arm"]

plr.Character=reanim
workspace.Camera.CameraSubject=reanim
HumanDied = false
te(
    ct,
    reanim.Humanoid.Died:Connect(
        function()
            HumanDied = true
            fliiiin:Destroy()
            reanim.HumanoidRootPart.Anchored = true
            old = reanim.HumanoidRootPart.CFrame
            reanim.HumanoidRootPart.CFrame = old
            wait()
            reanim.HumanoidRootPart.CFrame = old
            char.Humanoid:Destroy()
            Instance.new("Humanoid", char)
            plr.Character = char
            char:BreakJoints()
            game.Players:Chat("-gr")
            for i, v in next, ct do
                v:Disconnect()
            end
        end
    )
)
