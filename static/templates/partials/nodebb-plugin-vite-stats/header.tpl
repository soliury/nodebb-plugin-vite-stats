<!-- IF totalReward -->
<div class="vite-stats-plugin">
    <div class="vite-stats-item">
        <div class="vite-stats-item-header">
            <i class="fa fa-superpowers"></i>
            [[vite:sbp.total]]
        </div>
        <div class="vite-stats-value">
          <a href="https://explorer.vite.net/SBPList" target="_blank">
               {superNum}
          </a>
        </div>
    </div>
    <div class="vite-stats-item">
        <div class="vite-stats-item-header">
            <i class="fa fa-cubes"></i>
            [[vite:node.total]]
        </div>
        <div class="vite-stats-value">
            <a href="https://forum.vite.net/full-node" target="_blank">
                {nodesNum}
            </a>
        </div>
    </div>
    <div class="vite-stats-item">
        <div class="vite-stats-item-header">
            <i class="fa fa-hourglass"></i>
            [[vite:fullnode.total.reward]]
        </div>
        <div class="vite-stats-value">
            {totalReward} vite
        </div>
    </div>
    <div class="vite-stats-item">
        <div class="vite-stats-item-header">
            <i class="fa fa-thumbs-o-up"></i>
            [[vite:vote.total]]
        </div>
        <div class="vite-stats-value">
            {userTotalReward} vite
        </div>
    </div>
</div>
<!-- ENDIF list.length -->
