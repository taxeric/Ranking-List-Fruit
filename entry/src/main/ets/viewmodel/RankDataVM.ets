import { rankData1, rankData2 } from '../models/DataModel';
import { RankData } from './RankData';
export class RankDataVM {

  loadRankData1(): RankData[] {
    return rankData1
  }

  loadRankData2(): RankData[] {
    return rankData2
  }
}